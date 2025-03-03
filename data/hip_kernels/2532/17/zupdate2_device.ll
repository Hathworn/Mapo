; ModuleID = '../data/hip_kernels/2532/17/main.cu'
source_filename = "../data/hip_kernels/2532/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8zupdate2PfS_fii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %3
  %24 = add nsw i32 %23, %14
  %25 = icmp slt i32 %14, %3
  %26 = icmp slt i32 %22, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %93

28:                                               ; preds = %5
  %29 = sext i32 %24 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = add nsw i32 %3, -1
  %33 = icmp eq i32 %14, %32
  br i1 %33, label %40, label %34

34:                                               ; preds = %28
  %35 = add nsw i32 %24, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fsub contract float %38, %31
  br label %40

40:                                               ; preds = %34, %28
  %41 = phi float [ 0.000000e+00, %28 ], [ %39, %34 ]
  %42 = add nsw i32 %4, -1
  %43 = icmp eq i32 %22, %42
  br i1 %43, label %50, label %44

44:                                               ; preds = %40
  %45 = add nsw i32 %24, %3
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fsub contract float %48, %31
  br label %50

50:                                               ; preds = %44, %40
  %51 = phi float [ 0.000000e+00, %40 ], [ %49, %44 ]
  %52 = fmul contract float %41, %41
  %53 = fmul contract float %51, %51
  %54 = fadd contract float %52, %53
  %55 = fcmp olt float %54, 0x39F0000000000000
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %54, %56
  %58 = tail call float @llvm.sqrt.f32(float %57)
  %59 = bitcast float %58 to i32
  %60 = add nsw i32 %59, -1
  %61 = bitcast i32 %60 to float
  %62 = add nsw i32 %59, 1
  %63 = bitcast i32 %62 to float
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 608)
  %65 = select i1 %55, float 0x3EF0000000000000, float 1.000000e+00
  %66 = fneg float %63
  %67 = tail call float @llvm.fma.f32(float %66, float %58, float %57)
  %68 = fcmp ogt float %67, 0.000000e+00
  %69 = fneg float %61
  %70 = tail call float @llvm.fma.f32(float %69, float %58, float %57)
  %71 = fcmp ole float %70, 0.000000e+00
  %72 = select i1 %71, float %61, float %58
  %73 = select i1 %68, float %63, float %72
  %74 = fmul float %65, %73
  %75 = select i1 %64, float %57, float %74
  %76 = fmul contract float %75, %2
  %77 = fadd contract float %76, 1.000000e+00
  %78 = fdiv contract float 1.000000e+00, %77
  %79 = shl nsw i32 %24, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %41, %2
  %84 = fadd contract float %83, %82
  %85 = fmul contract float %84, %78
  store float %85, float addrspace(1)* %81, align 4, !tbaa !7
  %86 = add nuw nsw i32 %79, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fmul contract float %51, %2
  %91 = fadd contract float %90, %89
  %92 = fmul contract float %91, %78
  store float %92, float addrspace(1)* %88, align 4, !tbaa !7
  br label %93

93:                                               ; preds = %50, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
