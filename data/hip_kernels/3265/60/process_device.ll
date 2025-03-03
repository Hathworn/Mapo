; ModuleID = '../data/hip_kernels/3265/60/main.cu'
source_filename = "../data/hip_kernels/3265/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7processiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %110

15:                                               ; preds = %4
  %16 = icmp sgt i32 %0, 0
  br i1 %16, label %17, label %106

17:                                               ; preds = %15
  %18 = mul nsw i32 %13, 12288
  br label %19

19:                                               ; preds = %17, %19
  %20 = phi i32 [ 0, %17 ], [ %28, %19 ]
  %21 = phi float [ 0.000000e+00, %17 ], [ %104, %19 ]
  %22 = urem i32 %20, 12288
  %23 = add nsw i32 %22, %18
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = fadd contract float %21, %26
  %28 = add nuw nsw i32 %20, 1
  %29 = urem i32 %28, 12288
  %30 = add nsw i32 %29, %18
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fadd contract float %27, %33
  %35 = add nuw nsw i32 %20, 2
  %36 = urem i32 %35, 12288
  %37 = add nsw i32 %36, %18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %2, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fadd contract float %34, %40
  %42 = add nuw nsw i32 %20, 3
  %43 = urem i32 %42, 12288
  %44 = add nsw i32 %43, %18
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fadd contract float %41, %47
  %49 = add nuw nsw i32 %20, 4
  %50 = urem i32 %49, 12288
  %51 = add nsw i32 %50, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fadd contract float %48, %54
  %56 = add nuw nsw i32 %20, 5
  %57 = urem i32 %56, 12288
  %58 = add nsw i32 %57, %18
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fadd contract float %55, %61
  %63 = add nuw nsw i32 %20, 6
  %64 = urem i32 %63, 12288
  %65 = add nsw i32 %64, %18
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fadd contract float %62, %68
  %70 = add nuw nsw i32 %20, 7
  %71 = urem i32 %70, 12288
  %72 = add nsw i32 %71, %18
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fadd contract float %69, %75
  %77 = add nuw nsw i32 %20, 8
  %78 = urem i32 %77, 12288
  %79 = add nsw i32 %78, %18
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fadd contract float %76, %82
  %84 = add nuw nsw i32 %20, 9
  %85 = urem i32 %84, 12288
  %86 = add nsw i32 %85, %18
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = fadd contract float %83, %89
  %91 = add nuw nsw i32 %20, 10
  %92 = urem i32 %91, 12288
  %93 = add nsw i32 %92, %18
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = fadd contract float %90, %96
  %98 = add nuw nsw i32 %20, 11
  %99 = urem i32 %98, 12288
  %100 = add nsw i32 %99, %18
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fadd contract float %97, %103
  %105 = icmp eq i32 %28, %0
  br i1 %105, label %106, label %19, !llvm.loop !11

106:                                              ; preds = %19, %15
  %107 = phi float [ 0.000000e+00, %15 ], [ %104, %19 ]
  %108 = sext i32 %13 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %3, i64 %108
  store float %107, float addrspace(1)* %109, align 4, !tbaa !7
  br label %110

110:                                              ; preds = %4, %106
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
