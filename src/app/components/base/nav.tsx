"use client";
import Link from "next/link";
import { Chip } from "@heroui/react";
import { usePathname } from "next/navigation";
import { routes } from "@/app/config/routes";

const ChevronRightIcon = ({ className = "" }: { className?: string }) => {
  return (
    <svg
      aria-hidden="true"
      fill="none"
      focusable="false"
      height="1em"
      role="presentation"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="1.5"
      viewBox="0 0 24 24"
      width="1em"
      className={className}
    >
      <path d="m9 18 6-6-6-6" />
    </svg>
  );
};

export default function Nav() {
  const pathname = usePathname();
  return (
    <nav className="mt-1 text-[#767383]">
      <ul className="[&>li]:flex [&>li]:py-1 [&>li]:items-center [&>li:not(:last-child)]:mb-4 pr-2.5">
        {routes.map((route) => (
          <li key={route.path}>
            {route.enabled ? (
              <>
                <Link href={route.path} className="block hover:underline">
                  {route.title}
                </Link>
                {pathname === route.path && (
                  <>
                    <ChevronRightIcon className="ml-auto hidden lg:block" />
                  </>
                )}
              </>
            ) : (
              <>
                <span>{route.title}</span>
                <Chip size="sm" isDisabled color="default" className="ml-3">
                  Em breve
                </Chip>
              </>
            )}
          </li>
        ))}
      </ul>
    </nav>
  );
}
