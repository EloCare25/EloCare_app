"use client";
import { ScrollShadow } from "@heroui/react";

export default function Main({ children }: { children: React.ReactNode }) {
  const closeMenu = () => {
    document.body.classList.remove("menu-opened");
  };

  return (
    <ScrollShadow hideScrollBar className="h-full">
      <div onClickCapture={closeMenu}>
        {children}
      </div>
    </ScrollShadow>
  );
}
