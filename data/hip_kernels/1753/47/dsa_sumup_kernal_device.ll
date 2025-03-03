; ModuleID = '../data/hip_kernels/1753/47/main.cu'
source_filename = "../data/hip_kernels/1753/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16dsa_sumup_kernalPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = sdiv i32 %1, 2
  %11 = add nsw i32 %10, 1
  %12 = mul nsw i32 %11, %2
  %13 = icmp slt i32 %1, -1
  %14 = shl nsw i32 %12, 1
  %15 = mul nsw i32 %12, 3
  br i1 %13, label %55, label %16

16:                                               ; preds = %3
  %17 = and i32 %11, 1
  %18 = add i32 %1, 1
  %19 = icmp ult i32 %18, 3
  br i1 %19, label %22, label %20

20:                                               ; preds = %16
  %21 = and i32 %11, -2
  br label %71

22:                                               ; preds = %71, %16
  %23 = phi float [ undef, %16 ], [ %105, %71 ]
  %24 = phi float [ undef, %16 ], [ %110, %71 ]
  %25 = phi float [ undef, %16 ], [ %115, %71 ]
  %26 = phi float [ undef, %16 ], [ %120, %71 ]
  %27 = phi float [ 0.000000e+00, %16 ], [ %105, %71 ]
  %28 = phi i32 [ 0, %16 ], [ %121, %71 ]
  %29 = phi float [ 0.000000e+00, %16 ], [ %120, %71 ]
  %30 = phi float [ 0.000000e+00, %16 ], [ %115, %71 ]
  %31 = phi float [ 0.000000e+00, %16 ], [ %110, %71 ]
  %32 = icmp eq i32 %17, 0
  br i1 %32, label %55, label %33

33:                                               ; preds = %22
  %34 = mul nuw nsw i32 %28, %9
  %35 = add nuw nsw i32 %34, %4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = fadd contract float %27, %38
  %40 = add nsw i32 %35, %12
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = fadd contract float %31, %43
  %45 = add nsw i32 %35, %14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = fadd contract float %30, %48
  %50 = add nsw i32 %35, %15
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fadd contract float %29, %53
  br label %55

55:                                               ; preds = %33, %22, %3
  %56 = phi float [ 0.000000e+00, %3 ], [ %24, %22 ], [ %44, %33 ]
  %57 = phi float [ 0.000000e+00, %3 ], [ %25, %22 ], [ %49, %33 ]
  %58 = phi float [ 0.000000e+00, %3 ], [ %26, %22 ], [ %54, %33 ]
  %59 = phi float [ 0.000000e+00, %3 ], [ %23, %22 ], [ %39, %33 ]
  %60 = zext i32 %4 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !7
  %62 = add nsw i32 %12, %4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  store float %56, float addrspace(1)* %64, align 4, !tbaa !7
  %65 = add nsw i32 %14, %4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float %57, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = add nsw i32 %15, %4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float %58, float addrspace(1)* %70, align 4, !tbaa !7
  ret void

71:                                               ; preds = %71, %20
  %72 = phi float [ 0.000000e+00, %20 ], [ %105, %71 ]
  %73 = phi i32 [ 0, %20 ], [ %121, %71 ]
  %74 = phi float [ 0.000000e+00, %20 ], [ %120, %71 ]
  %75 = phi float [ 0.000000e+00, %20 ], [ %115, %71 ]
  %76 = phi float [ 0.000000e+00, %20 ], [ %110, %71 ]
  %77 = phi i32 [ 0, %20 ], [ %122, %71 ]
  %78 = mul nuw nsw i32 %73, %9
  %79 = add nuw nsw i32 %78, %4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fadd contract float %72, %82
  %84 = add nsw i32 %79, %12
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %88 = fadd contract float %76, %87
  %89 = add nsw i32 %79, %14
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = fadd contract float %75, %92
  %94 = add nsw i32 %79, %15
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = fadd contract float %74, %97
  %99 = or i32 %73, 1
  %100 = mul nuw nsw i32 %99, %9
  %101 = add nuw nsw i32 %100, %4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = fadd contract float %83, %104
  %106 = add nsw i32 %101, %12
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = fadd contract float %88, %109
  %111 = add nsw i32 %101, %14
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = fadd contract float %93, %114
  %116 = add nsw i32 %101, %15
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !6
  %120 = fadd contract float %98, %119
  %121 = add nuw nsw i32 %73, 2
  %122 = add i32 %77, 2
  %123 = icmp eq i32 %122, %21
  br i1 %123, label %22, label %71, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
