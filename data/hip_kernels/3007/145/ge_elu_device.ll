; ModuleID = '../data/hip_kernels/3007/145/main.cu'
source_filename = "../data/hip_kernels/3007/145/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6ge_eluiifPKfiiPfii(i32 %0, i32 %1, float %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %1
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %68

30:                                               ; preds = %9
  %31 = add nsw i32 %18, %4
  %32 = mul nsw i32 %26, %5
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul float %36, 0x3FF7154760000000
  %38 = tail call float @llvm.rint.f32(float %37)
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %39, float 0x3FE62E4300000000, float %36)
  %41 = tail call float @llvm.fma.f32(float %39, float 0xBE205C6100000000, float %40)
  %42 = tail call float @llvm.fmuladd.f32(float %41, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %43 = tail call float @llvm.fmuladd.f32(float %41, float %42, float 0x3F8110FF20000000)
  %44 = tail call float @llvm.fmuladd.f32(float %41, float %43, float 0x3FA5555020000000)
  %45 = tail call float @llvm.fmuladd.f32(float %41, float %44, float 0x3FC5555560000000)
  %46 = tail call float @llvm.fmuladd.f32(float %41, float %45, float 5.000000e-01)
  %47 = fmul float %41, %46
  %48 = tail call float @llvm.fma.f32(float %41, float %47, float %41)
  %49 = fcmp oeq float %38, 1.280000e+02
  %50 = fptosi float %38 to i32
  %51 = select i1 %49, i32 127, i32 %50
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %51)
  %53 = fadd float %52, -1.000000e+00
  %54 = tail call float @llvm.fma.f32(float %52, float %48, float %53)
  %55 = fmul float %54, 2.000000e+00
  %56 = select i1 %49, float %55, float %54
  %57 = fcmp ogt float %36, 0x40562E42E0000000
  %58 = select i1 %57, float 0x7FF0000000000000, float %56
  %59 = fcmp olt float %36, -1.700000e+01
  %60 = select i1 %59, float -1.000000e+00, float %58
  %61 = fmul contract float %60, %2
  %62 = tail call float @llvm.maxnum.f32(float %36, float %61)
  %63 = add nsw i32 %18, %7
  %64 = mul nsw i32 %26, %8
  %65 = add nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %6, i64 %66
  store float %62, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %30, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
