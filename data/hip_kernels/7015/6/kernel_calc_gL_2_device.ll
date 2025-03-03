; ModuleID = '../data/hip_kernels/7015/6/main.cu'
source_filename = "../data/hip_kernels/7015/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16kernel_calc_gL_2iPiS_PfS0_S0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #1 {
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast i32 addrspace(5)* %8 to i32*
  %10 = bitcast i32 addrspace(5)* %8 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %10) #4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %16
  %19 = add i32 %18, %11
  store volatile i32 %19, i32* %9, align 4, !tbaa !7
  %20 = sext i32 %0 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = load volatile i32, i32* %9, align 4, !tbaa !7
  %24 = add nsw i32 %22, -1
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %67

26:                                               ; preds = %7
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = load volatile i32, i32* %9, align 4, !tbaa !7
  %30 = add nsw i32 %29, %28
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !11, !amdgpu.noclobber !6
  %34 = fneg contract float %33
  %35 = fmul float %33, 0xBFF7154760000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = fcmp olt float %33, 0xC0562E4300000000
  %38 = fcmp ogt float %33, 0x4059D1DA00000000
  %39 = fneg float %35
  %40 = tail call float @llvm.fma.f32(float %34, float 0x3FF7154760000000, float %39)
  %41 = tail call float @llvm.fma.f32(float %34, float 0x3E54AE0BE0000000, float %40)
  %42 = fsub float %35, %36
  %43 = fadd float %41, %42
  %44 = tail call float @llvm.exp2.f32(float %43)
  %45 = fptosi float %36 to i32
  %46 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 %45)
  %47 = select i1 %38, float 0.000000e+00, float %46
  %48 = select i1 %37, float 0x7FF0000000000000, float %47
  %49 = fadd contract float %48, 1.000000e+00
  %50 = fmul contract float %49, %49
  %51 = fdiv contract float %48, %50
  %52 = load volatile i32, i32* %9, align 4, !tbaa !7
  %53 = add nsw i32 %52, %28
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11, !amdgpu.noclobber !6
  %57 = load volatile i32, i32* %9, align 4, !tbaa !7
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !6
  %61 = fsub contract float %56, %60
  %62 = fmul contract float %61, %51
  %63 = load volatile i32, i32* %9, align 4, !tbaa !7
  %64 = add nsw i32 %63, %28
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %6, i64 %65
  store float %62, float addrspace(1)* %66, align 4, !tbaa !11
  br label %67

67:                                               ; preds = %7, %26
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %10) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
