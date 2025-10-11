"use client";

export default function Main({ children }: { children: React.ReactNode }) {
  const closeMenu = () => {
    document.body.classList.remove("menu-opened");
  };

  return <div onClickCapture={closeMenu}>{children}</div>;
}
