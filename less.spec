Summary: A text file browser similar to more, but better.
Name: less
Version: 358
Release: 7
License: GPL
Group: Applications/Text
Source: http://www.flash.net/~marknu/less/%{name}-%{version}.tar.gz
Source1: lesspipe.sh
Source2: less.sh
Source3: less.csh
Patch: less-shell.patch
URL: http://www.flash.net/~marknu/less/
Buildroot: /var/tmp/less-root

%description
The less utility is a text file browser that resembles more, but has
more capabilities.  Less allows you to move backwards in the file as
well as forwards.  Since less doesn't have to read the entire input file
before it starts, less starts up more quickly than text editors (for
example, vi). 

You should install less because it is a basic utility for viewing text
files, and you'll use it frequently.

%prep
%setup -q
%patch -p1 -b .bug

%build
%configure
make CC="gcc $RPM_OPT_FLAGS" datadir=%{_docdir}

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall
strip -R .comment $RPM_BUILD_ROOT/usr/bin/less
mkdir -p $RPM_BUILD_ROOT/etc/profile.d
install -c -m 755 %{SOURCE1} $RPM_BUILD_ROOT/usr/bin/
install -c -m 755 %{SOURCE2} $RPM_BUILD_ROOT/etc/profile.d
install -c -m 755 %{SOURCE3} $RPM_BUILD_ROOT/etc/profile.d

%files
%defattr(-,root,root)
/etc/profile.d/*
/usr/bin/*
%{_mandir}/man1/*

%clean
rm -rf $RPM_BUILD_ROOT

%changelog
* Wed Aug 23 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- support files with spaces in their names (Bug #16777)

* Tue Aug  8 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Support gzipped man pages in lesspipe.sh (Bug #15610)

* Thu Aug  3 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Tweak init script (Bug #14622)

* Thu Jul 27 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Oops, actually apply the patch for 9443. ;)

* Wed Jul 26 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Fix up messed output if a user outputs anything in ~/.bashrc or the
  likes (Bug #9443)
- handle RPM_OPT_FLAGS

* Thu Jul 13 2000 Prospector <bugzilla@redhat.com>
- automatic rebuild

* Thu Jul 13 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- 358

* Mon Jun 26 2000 Matt Wilson <msw@redhat.com>
- defattr root

* Mon Jun 19 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- FHSify

* Fri Apr 14 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- 354

* Mon Mar 20 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Update to v352

* Tue Mar  7 2000 Jeff Johnson <jbj@redhat.com>
- rebuild for sparc baud rates > 38400.

* Tue Jan 25 2000 Bernhard Rosenkraenzer <bero@redhat.com>
- Update to v346
- Update download URL
- use the configure marcro
- strip binary
- fix up lesspipe stuff (Bug #8750 and a couple of non-reported bugs)
  (Karsten, did I mention I'll kill you when you return from SAP? ;) )

* Sun Jan 07 2000 Karsten Hopp <karsten@redhat.de>
- added lesspipe.sh to show listings of package
  contents instead of binary output.

* Fri Aug 27 1999 Preston Brown <pbrown@redhat.com>
- less finally gets maintenance, upgraded to 340

* Sun Mar 21 1999 Cristian Gafton <gafton@redhat.com> 
- auto rebuild in the new build environment (release 6)

* Tue Mar 16 1999 Preston Brown <pbrown@redhat.com>
- removed ifarch axp stuff for /bin/more, more now works on alpha properly.

* Wed Feb 24 1999 Preston Brown <pbrown@redhat.com>
- Injected new description and group.

* Fri Dec 18 1998 Preston Brown <pbrown@redhat.com>
- bumped spec number for initial rh 6.0 build

* Thu May 07 1998 Prospector System <bugs@redhat.com>

- translations modified for de, fr, tr

* Wed Apr 08 1998 Cristian Gafton <gafton@redhat.com>
- updated to 332 and built for Manhattan
- added buildroot

* Mon Jun 02 1997 Erik Troan <ewt@redhat.com>
- built against glibc
