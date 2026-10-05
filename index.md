---
layout: default
title: My Project Vault
---

<!-- ── HERO ── -->
<div class="hero">
  <div class="hero-top">
    <p class="hero-eyebrow"><span class="hero-live"></span>[Phase] · [Sprint] · [Month Year]</p>
    <div class="hero-top-right">
      <button class="btn-start-here" onclick="showStartHere()">Start here</button>
    </div>
  </div>
  <h1 class="hero-title">[Project Name].<br>[One-line tagline.]</h1>
  <p class="hero-sub">
    [Two sentences. What does this product do? Who is it for? What's the core value?]
  </p>
  <div class="hero-readout">
    <div class="hero-stat">
      <span class="hero-stat-value">[Phase]</span>
      <span class="hero-stat-label">Current Phase</span>
    </div>
    <div class="hero-stat">
      <span class="hero-stat-value">[#]</span>
      <span class="hero-stat-label">[Key Metric]</span>
    </div>
    <div class="hero-stat">
      <span class="hero-stat-value">[#]</span>
      <span class="hero-stat-label">[Key Metric]</span>
    </div>
  </div>
</div>

<!-- ══ 01 · THE PROBLEM ══════════════════════════════════════════ -->
<div class="section-heading" style="margin-top:2rem"><h2>01 · The Problem</h2></div>
<div class="sprint-note">
  <span class="sprint-note-label">Why we exist</span>
  [Replace with your problem statement. What is broken today? Who feels the pain? What does the market look like?]
</div>

<!-- ══ 02 · HOW IT WORKS ══════════════════════════════════════════ -->
<div class="section-heading" style="margin-top:2.5rem"><h2>02 · How It Works</h2></div>
<div class="metrics-table" style="margin-bottom:1rem">
  <div class="metrics-table-row metrics-table-header">
    <span>Step</span><span>Who</span><span>What happens</span>
  </div>
  <div class="metrics-table-row">
    <span class="mt-name">1 · [Step name]</span>
    <span class="mt-val">[Actor]</span>
    <span class="mt-target">[What happens in this step]</span>
  </div>
  <div class="metrics-table-row">
    <span class="mt-name">2 · [Step name]</span>
    <span class="mt-val">[Actor]</span>
    <span class="mt-target">[What happens in this step]</span>
  </div>
  <div class="metrics-table-row">
    <span class="mt-name">3 · [Step name]</span>
    <span class="mt-val">[Actor]</span>
    <span class="mt-target">[What happens in this step]</span>
  </div>
</div>

<!-- ══ 03 · NOW ══════════════════════════════════════════ -->
<div class="section-heading" style="margin-top:2.5rem"><h2>03 · Now</h2></div>
<div class="sprint-note">
  <span class="sprint-note-label">[Sprint name] · [Phase] · [Month Year]</span>
  [What is the team focused on right now? What's being built?]
</div>

<!-- ══ 04 · KNOWLEDGE BASE ══════════════════════════════════════════ -->
<div class="section-heading" id="vault-section" style="margin-top:2.5rem"><h2>04 · Knowledge Base</h2></div>

<div class="kb-toc" id="vaultToc">

  <div class="kb-section">
    <span class="kb-section-label">[Section Name]</span>
    <div class="kb-links">
      <div class="kb-link-row"><a href="{{ '/section-name/index' | relative_url }}">[Page Title]</a><span class="kb-desc">[One-line description of this page]</span></div>
    </div>
  </div>

</div>

<!-- ── START HERE OVERLAY ── -->
<div class="start-here-overlay" id="startHereOverlay" style="display:none">
  <div class="start-here-card">
    <div class="start-here-header">
      <span class="start-here-eyebrow">New to this vault?</span>
      <h2>Start here.</h2>
      <p class="start-here-sub">3 pages · ~10 min · full context on why, what, and where we are</p>
    </div>
    <div class="start-here-steps">
      <a class="start-here-step" href="{{ '/section-name/index' | relative_url }}">
        <span class="step-num">1</span>
        <div class="step-body">
          <div class="step-title-row">
            <strong>[Step title]</strong>
            <span class="step-badge step-badge--strategy">Strategy</span>
          </div>
          <span>[What will the reader understand after reading this page?]</span>
        </div>
      </a>
    </div>
    <button class="start-here-dismiss" onclick="dismissStartHere()">I'm up to speed →</button>
  </div>
</div>

{% raw %}
<script>
(function() {
  window.showStartHere = function() {
    var el = document.getElementById('startHereOverlay');
    if (el) { el.style.display = 'flex'; document.body.style.overflow = 'hidden'; }
  };
  window.dismissStartHere = function() {
    var el = document.getElementById('startHereOverlay');
    if (el) { el.style.display = 'none'; document.body.style.overflow = ''; }
    try { sessionStorage.setItem('vault-seen-start', '1'); } catch(e) {}
  };
  try { if (!sessionStorage.getItem('vault-seen-start')) { showStartHere(); } } catch(e) {}
  var overlay = document.getElementById('startHereOverlay');
  if (overlay) {
    overlay.addEventListener('click', function(e) { if (e.target === overlay) dismissStartHere(); });
  }
  window.runSearch = function(q) {
    document.querySelectorAll('#vaultToc .kb-section').forEach(function(section) {
      var anyVisible = false;
      section.querySelectorAll('.kb-link-row').forEach(function(row) {
        var show = !q || row.textContent.toLowerCase().includes(q);
        row.style.display = show ? '' : 'none';
        if (show) anyVisible = true;
      });
      section.style.display = anyVisible ? '' : 'none';
    });
  };
  try {
    var q = new URLSearchParams(window.location.search).get('q');
    if (q) {
      var ns = document.getElementById('navSearch');
      if (ns) ns.value = q;
      window.runSearch(q.toLowerCase().trim());
    }
  } catch(e) {}
})();
</script>
{% endraw %}
