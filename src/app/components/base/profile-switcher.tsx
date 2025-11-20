"use client";

import { Dropdown, DropdownTrigger, DropdownMenu, DropdownItem, User } from "@heroui/react";
import { useProfile } from "@/app/providers/profile-provider";
import { PROFILE_LABELS, type ProfileType } from "@/app/types/profile";

export default function ProfileSwitcher() {
  const { profile, setProfile, isLoading } = useProfile();

  const handleProfileChange = async (key: ProfileType) => {
    if (key !== profile) {
      await setProfile(key);
    }
  };

  return (
    <Dropdown placement="bottom-end">
      <DropdownTrigger>
        <User
          name={PROFILE_LABELS[profile]}
          className="cursor-pointer transition-opacity"
          avatarProps={{
            name: "P",
            isBordered: true,
            color: profile === "user" ? "primary" : "success",
          }}
        />
      </DropdownTrigger>
      <DropdownMenu
        aria-label="Perfil"
        disallowEmptySelection
        selectionMode="single"
        selectedKeys={[profile]}
        onAction={(key) => handleProfileChange(key as ProfileType)}
      >
        <DropdownItem key="user">
          {PROFILE_LABELS.user}
        </DropdownItem>
        <DropdownItem key="professional">
          {PROFILE_LABELS.professional}
        </DropdownItem>
      </DropdownMenu>
    </Dropdown>
  );
}
