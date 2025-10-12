import { Geist, Geist_Mono } from "next/font/google";
import { UiProvider } from "./providers/ui-provider";
import Controls from "./components/base/controls";
import Header from "./components/base/header";
import Nav from "./components/base/nav";
import Main from "./components/base/main";
import "./globals.css";
import type { Metadata } from "next";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "EloCare | Revolucionando o acesso a exames e equipamentos de saúde",
  description:
    "Facilitamos o acesso a exames e equipamentos de saúde com tecnologia e conveniência, conectando pacientes e serviços de forma simples e eficiente",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-BR">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased p-4`}
      >
        <UiProvider>
          <div className="flex flex-col w-full max-w-[1440px] m-auto gap-4 justify-start">
            <div className="mb-4 lg:mb-0 w-full">
              <Header />
            </div>
            <div className="flex w-full max-lg:[body.menu-opened_&]:-translate-x-0 max-lg:-translate-x-[220px] transition-transform">
              <div className="min-w-[220px]">
                <Nav />
              </div>
              <div className="w-full">
                <div className="w-[calc(100vw-30px)] lg:w-full max m-auto pt-6 pb-4 lg:px-6 pr-4 h-[calc(100vh-110px)] flex rounded-2xl bg-[#CBC8D7] bg-[linear-gradient(245deg,rgba(203,200,215,1)_12%,rgba(124,119,150,1)_87%)] inset-shadow-sm inset-shadow-black-500/50">
                  <Controls />
                  <Main>{children}</Main>
                </div>
              </div>
            </div>
          </div>
        </UiProvider>
      </body>
    </html>
  );
}
