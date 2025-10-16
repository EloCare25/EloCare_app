"use client";
import { useEffect } from "react";
import { usePathname } from "next/navigation";

export default function Controls() {
  const pathname = usePathname();

  useEffect(() => {
    if (!pathname) return;

    document.body.classList.remove("menu-opened");
  }, [pathname]);

  const toggle = () => {
    document.body.classList.toggle("menu-opened");
  };

  return (
    <div className="lg:hidden relative -top-6 h-[calc(100%+40px)] rounded-tl-2xl rounded-bl-2xl mr-4">
      <div className="flex align-middle items-center justify-between p-1">
        <button
          className="hover:text-gray-400 rounded-lg p-2 cursor-pointer"
          onClick={toggle}
        >
          <svg
            width="20"
            height="20"
            viewBox="0 0 16 16"
            xmlns="http://www.w3.org/2000/svg"
            className="text-subdued"
            fill="currentColor"
          >
            <path d="M14 2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1zM2 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2z"></path>{" "}
            <path
              className=""
              d="M3 4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1z"
            ></path>
          </svg>
        </button>
      </div>
    </div>
  );
}
