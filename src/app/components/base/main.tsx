"use client";
import { ScrollShadow } from "@heroui/react";

export default function Main({ children }: { children: React.ReactNode }) {
  const closeMenu = () => {
    document.body.classList.remove("menu-opened");
  };

  return (
    <div onClickCapture={closeMenu} className="w-full">
      <ScrollShadow hideScrollBar className="h-full">
        <div className="h-[calc(100vh-150px)]">{children}</div>
      </ScrollShadow>
    </div>
  );
}
