use components::bullet_pane::BulletPane;
use leptos::*;

mod components;

fn main() {
    mount_to_body(|| {
        view! {
            <App />
        }
    });
}

#[component]
pub fn App() -> impl IntoView {
    view! {
        <BulletPane />
    } 
}
