/* ==========================================================================
   AAARK69 GitHub Directory - Application Logic
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
  // State Management
  let currentProjects = [...PROJECTS_DATA];
  let activeCategory = 'All';
  let activeTech = 'All';
  let searchQuery = '';
  let currentSort = 'recent';
  let currentView = 'grid'; // 'grid' | 'list'

  // DOM Elements
  const container = document.getElementById('projectsContainer');
  const searchInput = document.getElementById('searchInput');
  const sortSelect = document.getElementById('sortSelect');
  const categoryTabs = document.getElementById('categoryTabs');
  const techFilterChips = document.getElementById('techFilterChips');
  const gridViewBtn = document.getElementById('gridViewBtn');
  const listViewBtn = document.getElementById('listViewBtn');
  const themeToggleBtn = document.getElementById('themeToggleBtn');
  const copyProfileBtn = document.getElementById('copyProfileBtn');
  const toastContainer = document.getElementById('toastContainer');

  // Modal Elements
  const modal = document.getElementById('projectModal');
  const modalCloseBtn = document.getElementById('modalCloseBtn');
  const modalIcon = document.getElementById('modalIcon');
  const modalTitle = document.getElementById('modalTitle');
  const modalBadges = document.getElementById('modalBadges');
  const modalDesc = document.getElementById('modalDesc');
  const modalCloneCmd = document.getElementById('modalCloneCmd');
  const modalCopyBtn = document.getElementById('modalCopyBtn');
  const modalLang = document.getElementById('modalLang');
  const modalCategory = document.getElementById('modalCategory');
  const modalUpdated = document.getElementById('modalUpdated');
  const modalStars = document.getElementById('modalStars');
  const modalTags = document.getElementById('modalTags');
  const modalRepoBtn = document.getElementById('modalRepoBtn');
  const modalDemoBtn = document.getElementById('modalDemoBtn');

  // Initial Theme Load
  const savedTheme = localStorage.getItem('aaark69_theme') || 'dark';
  document.documentElement.setAttribute('data-theme', savedTheme);
  updateThemeIcon(savedTheme);

  // Initialize
  updateCounters();
  renderProjects();

  // Event Listeners - Search & Filter
  searchInput.addEventListener('input', (e) => {
    searchQuery = e.target.value.toLowerCase().trim();
    renderProjects();
  });

  sortSelect.addEventListener('change', (e) => {
    currentSort = e.target.value;
    renderProjects();
  });

  // Category Tabs Filter
  categoryTabs.addEventListener('click', (e) => {
    const btn = e.target.closest('.tab-btn');
    if (!btn) return;
    
    categoryTabs.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    activeCategory = btn.getAttribute('data-category');
    renderProjects();
  });

  // Tech Filter Chips
  techFilterChips.addEventListener('click', (e) => {
    const chip = e.target.closest('.tech-chip');
    if (!chip) return;

    techFilterChips.querySelectorAll('.tech-chip').forEach(c => c.classList.remove('active'));
    chip.classList.add('active');
    activeTech = chip.getAttribute('data-tech');
    renderProjects();
  });

  // View Mode Toggles
  gridViewBtn.addEventListener('click', () => {
    currentView = 'grid';
    gridViewBtn.classList.add('active');
    listViewBtn.classList.remove('active');
    container.classList.remove('list-view');
  });

  listViewBtn.addEventListener('click', () => {
    currentView = 'list';
    listViewBtn.classList.add('active');
    gridViewBtn.classList.remove('active');
    container.classList.add('list-view');
  });

  // Theme Toggle Handler
  themeToggleBtn.addEventListener('click', () => {
    const activeTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = activeTheme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('aaark69_theme', newTheme);
    updateThemeIcon(newTheme);
    showToast(`Switched to ${newTheme} mode!`);
  });

  function updateThemeIcon(theme) {
    themeToggleBtn.textContent = theme === 'dark' ? '🌙' : '☀️';
  }

  // Copy Profile URL
  copyProfileBtn.addEventListener('click', () => {
    navigator.clipboard.writeText('https://github.com/AAARK69');
    showToast('Copied GitHub profile URL to clipboard! 📋');
  });

  // Modal Handlers
  modalCloseBtn.addEventListener('click', closeModal);
  modal.addEventListener('click', (e) => {
    if (e.target === modal) closeModal();
  });
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && modal.classList.contains('active')) closeModal();
  });

  modalCopyBtn.addEventListener('click', () => {
    const cmd = modalCloneCmd.textContent;
    navigator.clipboard.writeText(cmd);
    showToast('Copied git clone command to clipboard!');
  });

  // Filtering & Sorting Core Logic
  function getFilteredProjects() {
    return PROJECTS_DATA.filter(p => {
      // Category Filter
      if (activeCategory !== 'All' && p.category !== activeCategory) {
        return false;
      }
      // Tech Filter
      if (activeTech !== 'All' && p.language !== activeTech) {
        return false;
      }
      // Search Query
      if (searchQuery) {
        const inName = p.name.toLowerCase().includes(searchQuery);
        const inDesc = p.description.toLowerCase().includes(searchQuery);
        const inCategory = p.category.toLowerCase().includes(searchQuery);
        const inTags = p.tags.some(t => t.toLowerCase().includes(searchQuery));
        if (!inName && !inDesc && !inCategory && !inTags) {
          return false;
        }
      }
      return true;
    }).sort((a, b) => {
      if (currentSort === 'recent') {
        return b.updatedTimestamp - a.updatedTimestamp;
      } else if (currentSort === 'name-asc') {
        return a.name.localeCompare(b.name);
      } else if (currentSort === 'name-desc') {
        return b.name.localeCompare(a.name);
      } else if (currentSort === 'stars') {
        return b.stars - a.stars;
      }
      return 0;
    });
  }

  // Render Projects Grid
  function renderProjects() {
    const filtered = getFilteredProjects();

    if (filtered.length === 0) {
      container.innerHTML = `
        <div class="no-results">
          <div class="no-results-icon">🔎</div>
          <h3>No matching projects found</h3>
          <p style="color: var(--text-muted); margin-top: 0.5rem;">Try adjusting your search terms or filter selections.</p>
        </div>
      `;
      return;
    }

    container.innerHTML = filtered.map(p => createProjectCardHTML(p)).join('');

    // Attach Event Listeners to Cards
    container.querySelectorAll('.project-card').forEach(card => {
      const id = card.getAttribute('data-id');
      const project = PROJECTS_DATA.find(item => item.id === id);

      card.querySelector('.btn-quick-view').addEventListener('click', (e) => {
        e.stopPropagation();
        openModal(project);
      });
    });
  }

  // Card HTML Template Generator
  function createProjectCardHTML(p) {
    const tagsHTML = p.tags.map(t => `<span class="tag-pill">${t}</span>`).join('');
    
    const demoBtnHTML = p.demoUrl 
      ? `<a href="${p.demoUrl}" target="_blank" rel="noopener noreferrer" class="action-icon-btn action-btn-demo" title="Launch Demo Site">🚀</a>`
      : '';

    const starHTML = p.stars > 0 ? `<span style="font-size: 0.8rem; color: var(--accent-amber); font-weight: 600;">⭐ ${p.stars}</span>` : '';

    return `
      <article class="project-card" data-id="${p.id}">
        <div>
          <div class="card-header">
            <div class="card-title-group">
              <span class="project-icon">${p.icon}</span>
              <div>
                <h3 class="project-name">${p.name}</h3>
                ${starHTML}
              </div>
            </div>
            <div class="card-meta-badges">
              ${p.isPwa ? '<span class="badge badge-pwa">PWA</span>' : ''}
              <span class="badge ${p.visibility === 'Public' ? 'badge-public' : 'badge-private'}">${p.visibility}</span>
            </div>
          </div>

          <p class="card-description">${p.description}</p>
          <div class="card-tags">${tagsHTML}</div>
        </div>

        <div class="card-footer">
          <div class="lang-indicator">
            <span class="lang-dot" style="background-color: ${p.languageColor};"></span>
            <span>${p.language}</span>
          </div>

          <div class="card-actions">
            ${demoBtnHTML}
            <a href="${p.repoUrl}" target="_blank" rel="noopener noreferrer" class="action-icon-btn" title="View Code Repository">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/></svg>
            </a>
            <button class="action-icon-btn btn-quick-view" title="Quick Specs & Details">🔍</button>
          </div>
        </div>
      </article>
    `;
  }

  // Modal Open Logic
  function openModal(p) {
    modalIcon.textContent = p.icon;
    modalTitle.textContent = p.name;
    modalDesc.textContent = p.longDescription || p.description;
    modalCloneCmd.textContent = `git clone ${p.repoUrl}.git`;
    modalLang.textContent = p.language;
    modalCategory.textContent = p.category;
    modalUpdated.textContent = p.updated;
    modalStars.textContent = `${p.stars} ⭐`;
    modalRepoBtn.href = p.repoUrl;

    if (p.demoUrl) {
      modalDemoBtn.href = p.demoUrl;
      modalDemoBtn.style.display = 'inline-flex';
    } else {
      modalDemoBtn.style.display = 'none';
    }

    modalBadges.innerHTML = `
      ${p.isPwa ? '<span class="badge badge-pwa">PWA</span>' : ''}
      <span class="badge ${p.visibility === 'Public' ? 'badge-public' : 'badge-private'}">${p.visibility}</span>
    `;

    modalTags.innerHTML = p.tags.map(t => `<span class="tag-pill">${t}</span>`).join('');

    modal.classList.add('active');
  }

  function closeModal() {
    modal.classList.remove('active');
  }

  // Toast System
  function showToast(message) {
    const toast = document.createElement('div');
    toast.className = 'toast';
    toast.innerHTML = `<span>✨</span><span>${message}</span>`;
    toastContainer.appendChild(toast);

    setTimeout(() => {
      toast.style.opacity = '0';
      toast.style.transform = 'translateY(10px)';
      setTimeout(() => toast.remove(), 300);
    }, 2500);
  }

  // Counter Computation
  function updateCounters() {
    const total = PROJECTS_DATA.length;
    const publicCount = PROJECTS_DATA.filter(p => p.visibility === 'Public').length;
    const pwaCount = PROJECTS_DATA.filter(p => p.isPwa).length;
    const demoCount = PROJECTS_DATA.filter(p => p.demoUrl !== null).length;

    document.getElementById('statTotal').textContent = total;
    document.getElementById('statPublic').textContent = publicCount;
    document.getElementById('statPwas').textContent = pwaCount;
    document.getElementById('statDemos').textContent = demoCount;
  }
});
