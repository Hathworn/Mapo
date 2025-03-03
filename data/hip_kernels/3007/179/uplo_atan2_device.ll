; ModuleID = '../data/hip_kernels/3007/179/main.cu'
source_filename = "../data/hip_kernels/3007/179/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_atan2iiiPKfiiS0_iiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %0
  %31 = icmp slt i32 %29, %0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %92

33:                                               ; preds = %12
  %34 = icmp eq i32 %1, 132
  %35 = mul nsw i32 %21, %2
  %36 = mul nsw i32 %29, %2
  %37 = icmp sgt i32 %35, %36
  %38 = icmp sge i32 %35, %36
  %39 = select i1 %34, i1 %37, i1 %38
  br i1 %39, label %40, label %92

40:                                               ; preds = %33
  %41 = add nsw i32 %21, %4
  %42 = mul nsw i32 %29, %5
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %21, %7
  %48 = mul nsw i32 %29, %8
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = tail call float @llvm.fabs.f32(float %52)
  %54 = tail call float @llvm.fabs.f32(float %46)
  %55 = tail call float @llvm.minnum.f32(float %53, float %54)
  %56 = tail call float @llvm.maxnum.f32(float %53, float %54)
  %57 = fdiv float %55, %56, !fpmath !11
  %58 = fmul float %57, %57
  %59 = tail call float @llvm.fmuladd.f32(float %58, float 0x3F65A54B00000000, float 0xBF8F4B2180000000)
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float 0x3FA53F67E0000000)
  %61 = tail call float @llvm.fmuladd.f32(float %58, float %60, float 0xBFB2FA9AE0000000)
  %62 = tail call float @llvm.fmuladd.f32(float %58, float %61, float 0x3FBB263640000000)
  %63 = tail call float @llvm.fmuladd.f32(float %58, float %62, float 0xBFC22C1CC0000000)
  %64 = tail call float @llvm.fmuladd.f32(float %58, float %63, float 0x3FC99717E0000000)
  %65 = tail call float @llvm.fmuladd.f32(float %58, float %64, float 0xBFD5554C40000000)
  %66 = fmul float %58, %65
  %67 = tail call float @llvm.fmuladd.f32(float %57, float %66, float %57)
  %68 = fsub float 0x3FF921FB60000000, %67
  %69 = fcmp ogt float %54, %53
  %70 = select i1 %69, float %68, float %67
  %71 = fsub float 0x400921FB60000000, %70
  %72 = fcmp olt float %52, 0.000000e+00
  %73 = select i1 %72, float %71, float %70
  %74 = bitcast float %52 to i32
  %75 = icmp slt i32 %74, 0
  %76 = select i1 %75, float 0x400921FB60000000, float 0.000000e+00
  %77 = fcmp oeq float %46, 0.000000e+00
  %78 = select i1 %77, float %76, float %73
  %79 = select i1 %72, float 0x4002D97C80000000, float 0x3FE921FB60000000
  %80 = fcmp oeq float %53, 0x7FF0000000000000
  %81 = fcmp oeq float %54, 0x7FF0000000000000
  %82 = and i1 %81, %80
  %83 = select i1 %82, float %79, float %78
  %84 = fcmp uno float %52, %46
  %85 = select i1 %84, float 0x7FF8000000000000, float %83
  %86 = tail call float @llvm.copysign.f32(float %85, float %46)
  %87 = add nsw i32 %21, %10
  %88 = mul nsw i32 %29, %11
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %9, i64 %90
  store float %86, float addrspace(1)* %91, align 4, !tbaa !7
  br label %92

92:                                               ; preds = %12, %40, %33
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
!11 = !{float 2.500000e+00}
