; ModuleID = '../data/hip_kernels/18004/9/main.cu'
source_filename = "../data/hip_kernels/18004/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10pythagorasPhS_S_S_(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %14
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !7, !amdgpu.noclobber !5
  %17 = uitofp i8 %16 to float
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %14
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !5
  %20 = uitofp i8 %19 to float
  %21 = fmul contract float %17, %17
  %22 = fmul contract float %20, %20
  %23 = fadd contract float %21, %22
  %24 = fcmp olt float %23, 0x39F0000000000000
  %25 = select i1 %24, float 0x41F0000000000000, float 1.000000e+00
  %26 = fmul float %23, %25
  %27 = tail call float @llvm.sqrt.f32(float %26)
  %28 = bitcast float %27 to i32
  %29 = add nsw i32 %28, -1
  %30 = bitcast i32 %29 to float
  %31 = add nsw i32 %28, 1
  %32 = bitcast i32 %31 to float
  %33 = tail call i1 @llvm.amdgcn.class.f32(float %26, i32 608)
  %34 = select i1 %24, float 0x3EF0000000000000, float 1.000000e+00
  %35 = fneg float %32
  %36 = tail call float @llvm.fma.f32(float %35, float %27, float %26)
  %37 = fcmp ogt float %36, 0.000000e+00
  %38 = fneg float %30
  %39 = tail call float @llvm.fma.f32(float %38, float %27, float %26)
  %40 = fcmp ole float %39, 0.000000e+00
  %41 = select i1 %40, float %30, float %27
  %42 = select i1 %37, float %32, float %41
  %43 = fmul float %34, %42
  %44 = select i1 %33, float %26, float %43
  %45 = fptoui float %44 to i8
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %14
  store i8 %45, i8 addrspace(1)* %46, align 1, !tbaa !7
  %47 = tail call float @llvm.minnum.f32(float %20, float %17)
  %48 = tail call float @llvm.maxnum.f32(float %20, float %17)
  %49 = fdiv float %47, %48, !fpmath !10
  %50 = fmul float %49, %49
  %51 = tail call float @llvm.fmuladd.f32(float %50, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float 0x3FA53F67E0000000)
  %53 = tail call float @llvm.fmuladd.f32(float %50, float %52, float 0xBFB2FA9AE0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %50, float %53, float 0x3FBB263640000000)
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %54, float 0xBFC22C1CC0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %50, float %55, float 0x3FC99717E0000000)
  %57 = tail call float @llvm.fmuladd.f32(float %50, float %56, float 0xBFD5554C40000000)
  %58 = fmul float %50, %57
  %59 = tail call float @llvm.fmuladd.f32(float %49, float %58, float %49)
  %60 = fsub float 0x3FF921FB60000000, %59
  %61 = fcmp ogt float %17, %20
  %62 = select i1 %61, float %60, float %59
  %63 = icmp eq i8 %16, 0
  %64 = select i1 %63, float 0.000000e+00, float %62
  %65 = tail call float @llvm.fabs.f32(float %64)
  %66 = fptoui float %65 to i8
  %67 = uitofp i8 %66 to double
  %68 = fmul contract double %67, 6.399400e+01
  %69 = fptoui double %68 to i8
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %14
  store i8 %69, i8 addrspace(1)* %70, align 1, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{float 2.500000e+00}
