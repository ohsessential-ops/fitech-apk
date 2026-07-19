# FiTech

**FiTech — Powered by Faizan**

FiTech is a financial ERP for TikTok Shop and e-commerce sellers. It is designed around the owner's real workflow: multiple shops, supplier-direct dispatch, order-level TikTok net earnings, supplier cost history, supplier payments, cash reconciliation, profit analytics, PDF reports, Excel imports, offline-first operation, and multi-user permissions.

## Current shops

1. Comfy Nest
2. Rug House
3. My Home Essential
4. Comfy Castle
5. OHS Essential
6. MomZone Textile

## Core formula

```text
Normal profit = TikTok net earning - supplier total cost
```

TikTok net earning means the amount already shown after TikTok deductions. Do not deduct TikTok fees again.

## Project status

This package is the first working project foundation. It contains:

- Product requirements
- Database plan
- UI/UX specification
- Google AI Studio master prompt
- Flutter starter source
- FiTech branding asset
- TikTok earnings screenshot reference

It is not yet a finished production APK. The next development milestone is the local database and financial-entry engine.

## Version 0.2

SQLite persistence, saved financial entries, search, live profit calculations, dashboard totals, and tests are now included.

## Version 0.3

Product management, dated supplier-cost history, SKU lookup, and automatic order-date cost selection are now included.

## Version 0.4

Supplier ledger, automatic order debits, Payoneer payments, supplier credits, corrections, running balance, and dashboard supplier metrics are included.

## Version 0.5

Bank ledger, actual-bank reconciliation, cash tracking, returns, customer refunds, supplier return credits, and adjusted profit are now included.

## Version 0.6

Reports, charts, shop analysis, product performance, PDF export, Excel export, and branded FiTech management reports are now included.

## Version 0.7

Enterprise authentication, user roles, permission architecture, audit logs, secure sessions, settings, verified local backup, offline sync foundation, Firebase setup templates, and production-security documentation are included.

## Version 0.8

Private Owner Edition with smart business insights, alerts, data-quality checks, and owner productivity tools. Cloud services remain optional for future activation.

## Version 0.9

Bulk CSV/XLSX imports, validation previews, duplicate prevention, tracking updates, supplier-payment imports and import history.

## Version 1.0

Automation & Productivity release with local business alerts, task management,
daily closing, automated owner checks, recent activity and upgraded owner metrics.

## Version 1.1

Professional Minimalist 3D UI Edition with a redesigned responsive dashboard, raised 3D buttons, professional main-menu cards, universal search, refined typography, loading skeletons, empty states and a reusable UI design system.

## Version 1.2
Marketplace integration foundation with accounts, adapters, sync jobs, logs and readiness for official APIs.

## v1.3 — Testing and optimization

Milestone 13 adds a source quality gate, safer marketplace database schema,
application error boundary, test/release checklists and corrected build-blocking
source issues. Run `python tools/quality_gate.py` for an offline source audit.
The full Flutter analyzer, test suite and APK build require the Flutter and
Android SDKs and are scheduled for Milestone 14.
