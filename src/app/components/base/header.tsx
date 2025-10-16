"use client";
import Image from "next/image";
import Link from "next/link";
import { User } from "@heroui/user";
import { usePathname } from "next/navigation";
import { routes } from "@/app/config/routes";


export default function Header() {
  const pathname = usePathname();
  const [currRoute] = routes.filter(route => route.pathname === pathname);

  return (
    <div className="flex align-middle items-center justify-between">
      <div className="flex align-middle items-center gap-2">
        <Link href="/">
          <Image
            src="/icon.png"
            alt="EloCare"
            width={42}
            height={42}
            className="rounded-full shadow-md p-1.5 bg-white"
          />
        </Link>
        <h1 className="font-semibold">
          <Link href="/">EloCare</Link>
        </h1>
        <span className="inline-flex lg:hidden">/ {currRoute?.title ?? ""}</span>
      </div>
      <User name="" className="cursor-pointer" />
    </div>
  );
}
