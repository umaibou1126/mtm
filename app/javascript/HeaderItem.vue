<template>
  <header id="header">
    <h1>This is the header.</h1>
    <nav id="header-nav">
      <ul>
        <router-link tag="li" id="new" to="/menu/new" exact> <a>New</a>
        <router-link tag="li" id="index" to="/" exact> <a>Index</a>
      </ul>
    </nav>
  </header>
</template>
