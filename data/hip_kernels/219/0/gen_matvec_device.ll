; ModuleID = '../data/hip_kernels/219/0/main.cu'
source_filename = "../data/hip_kernels/219/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10gen_matvecPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %3
  br i1 %15, label %16, label %143

16:                                               ; preds = %5
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %45

18:                                               ; preds = %16
  %19 = and i32 %4, 7
  %20 = icmp ult i32 %4, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = and i32 %4, -8
  br label %49

23:                                               ; preds = %49, %18
  %24 = phi float [ undef, %18 ], [ %139, %49 ]
  %25 = phi i32 [ 0, %18 ], [ %140, %49 ]
  %26 = phi float [ 0.000000e+00, %18 ], [ %139, %49 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %45, label %28

28:                                               ; preds = %23, %28
  %29 = phi i32 [ %42, %28 ], [ %25, %23 ]
  %30 = phi float [ %41, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %43, %28 ], [ 0, %23 ]
  %32 = zext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = mul nsw i32 %29, %3
  %36 = add i32 %35, %14
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %34, %39
  %41 = fadd contract float %30, %40
  %42 = add nuw nsw i32 %29, 1
  %43 = add i32 %31, 1
  %44 = icmp eq i32 %43, %19
  br i1 %44, label %45, label %28, !llvm.loop !11

45:                                               ; preds = %23, %28, %16
  %46 = phi float [ 0.000000e+00, %16 ], [ %24, %23 ], [ %41, %28 ]
  %47 = zext i32 %14 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  store float %46, float addrspace(1)* %48, align 4, !tbaa !7
  br label %143

49:                                               ; preds = %49, %21
  %50 = phi i32 [ 0, %21 ], [ %140, %49 ]
  %51 = phi float [ 0.000000e+00, %21 ], [ %139, %49 ]
  %52 = phi i32 [ 0, %21 ], [ %141, %49 ]
  %53 = zext i32 %50 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = mul nsw i32 %50, %3
  %57 = add i32 %56, %14
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %55, %60
  %62 = fadd contract float %51, %61
  %63 = or i32 %50, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = mul nsw i32 %63, %3
  %68 = add i32 %67, %14
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract float %66, %71
  %73 = fadd contract float %62, %72
  %74 = or i32 %50, 2
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = mul nsw i32 %74, %3
  %79 = add i32 %78, %14
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fmul contract float %77, %82
  %84 = fadd contract float %73, %83
  %85 = or i32 %50, 3
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %85, %3
  %90 = add i32 %89, %14
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %88, %93
  %95 = fadd contract float %84, %94
  %96 = or i32 %50, 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %1, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = mul nsw i32 %96, %3
  %101 = add i32 %100, %14
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %99, %104
  %106 = fadd contract float %95, %105
  %107 = or i32 %50, 5
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = mul nsw i32 %107, %3
  %112 = add i32 %111, %14
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fmul contract float %110, %115
  %117 = fadd contract float %106, %116
  %118 = or i32 %50, 6
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = mul nsw i32 %118, %3
  %123 = add i32 %122, %14
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %0, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fmul contract float %121, %126
  %128 = fadd contract float %117, %127
  %129 = or i32 %50, 7
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = mul nsw i32 %129, %3
  %134 = add i32 %133, %14
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %132, %137
  %139 = fadd contract float %128, %138
  %140 = add nuw nsw i32 %50, 8
  %141 = add i32 %52, 8
  %142 = icmp eq i32 %141, %22
  br i1 %142, label %23, label %49, !llvm.loop !13

143:                                              ; preds = %45, %5
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
