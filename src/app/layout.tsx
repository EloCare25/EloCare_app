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
          <div className="lg:grid lg:grid-cols-12 w-full max-w-[1440px] m-auto gap-4 justify-start">
            <div className="col-span-full mb-4 lg:mb-0">
              <Header />
            </div>
            <div className="flex lg:contents max-lg:[body.menu-opened_&]:-translate-x-0 max-lg:-translate-x-[230px] transition-transform">
              <div className="lg:col-span-3 2xl:col-span-2 min-w-[230px]">
                <Nav />
              </div>
              <div className="lg:col-span-9 2xl:col-span-10 w-full">
                <div className="w-[calc(100vw-36px)] lg:w-full max m-auto p-6 bg-[#cbc8d7] h-[calc(100vh-90px)] flex rounded-2xl">
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
