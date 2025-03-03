; ModuleID = '../data/hip_kernels/18057/38/main.cu'
source_filename = "../data/hip_kernels/18057/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10getMaxPorbiPKfiPfPiS2_i(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %122

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %23, label %49

23:                                               ; preds = %18
  %24 = and i32 %2, 7
  %25 = icmp ult i32 %2, 8
  br i1 %25, label %28, label %26

26:                                               ; preds = %23
  %27 = and i32 %2, -8
  br label %59

28:                                               ; preds = %59, %23
  %29 = phi i32 [ undef, %23 ], [ %117, %59 ]
  %30 = phi float [ undef, %23 ], [ %118, %59 ]
  %31 = phi float [ 0.000000e+00, %23 ], [ %118, %59 ]
  %32 = phi i32 [ 0, %23 ], [ %119, %59 ]
  %33 = phi i32 [ -1, %23 ], [ %117, %59 ]
  %34 = icmp eq i32 %24, 0
  br i1 %34, label %49, label %35

35:                                               ; preds = %28, %35
  %36 = phi float [ %45, %35 ], [ %31, %28 ]
  %37 = phi i32 [ %46, %35 ], [ %32, %28 ]
  %38 = phi i32 [ %44, %35 ], [ %33, %28 ]
  %39 = phi i32 [ %47, %35 ], [ 0, %28 ]
  %40 = zext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %21, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fcmp contract ugt float %36, %42
  %44 = select i1 %43, i32 %38, i32 %37
  %45 = select i1 %43, float %36, float %42
  %46 = add nuw nsw i32 %37, 1
  %47 = add i32 %39, 1
  %48 = icmp eq i32 %47, %24
  br i1 %48, label %49, label %35, !llvm.loop !11

49:                                               ; preds = %28, %35, %18
  %50 = phi i32 [ -1, %18 ], [ %29, %28 ], [ %44, %35 ]
  %51 = phi float [ 0.000000e+00, %18 ], [ %30, %28 ], [ %45, %35 ]
  %52 = sext i32 %16 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = sitofp i32 %6 to float
  %55 = fcmp contract ult float %51, %54
  %56 = select i1 %55, float 0.000000e+00, float %51
  store float %56, float addrspace(1)* %53, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %52
  store i32 %16, i32 addrspace(1)* %57, align 4, !tbaa !13
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %52
  store i32 %50, i32 addrspace(1)* %58, align 4, !tbaa !13
  br label %122

59:                                               ; preds = %59, %26
  %60 = phi float [ 0.000000e+00, %26 ], [ %118, %59 ]
  %61 = phi i32 [ 0, %26 ], [ %119, %59 ]
  %62 = phi i32 [ -1, %26 ], [ %117, %59 ]
  %63 = phi i32 [ 0, %26 ], [ %120, %59 ]
  %64 = zext i32 %61 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %21, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = fcmp contract ugt float %60, %66
  %68 = select i1 %67, i32 %62, i32 %61
  %69 = select i1 %67, float %60, float %66
  %70 = or i32 %61, 1
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %21, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = fcmp contract ugt float %69, %73
  %75 = select i1 %74, i32 %68, i32 %70
  %76 = select i1 %74, float %69, float %73
  %77 = or i32 %61, 2
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %21, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = fcmp contract ugt float %76, %80
  %82 = select i1 %81, i32 %75, i32 %77
  %83 = select i1 %81, float %76, float %80
  %84 = or i32 %61, 3
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %21, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fcmp contract ugt float %83, %87
  %89 = select i1 %88, i32 %82, i32 %84
  %90 = select i1 %88, float %83, float %87
  %91 = or i32 %61, 4
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %21, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = fcmp contract ugt float %90, %94
  %96 = select i1 %95, i32 %89, i32 %91
  %97 = select i1 %95, float %90, float %94
  %98 = or i32 %61, 5
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %21, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fcmp contract ugt float %97, %101
  %103 = select i1 %102, i32 %96, i32 %98
  %104 = select i1 %102, float %97, float %101
  %105 = or i32 %61, 6
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %21, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fcmp contract ugt float %104, %108
  %110 = select i1 %109, i32 %103, i32 %105
  %111 = select i1 %109, float %104, float %108
  %112 = or i32 %61, 7
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %21, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fcmp contract ugt float %111, %115
  %117 = select i1 %116, i32 %110, i32 %112
  %118 = select i1 %116, float %111, float %115
  %119 = add nuw nsw i32 %61, 8
  %120 = add i32 %63, 8
  %121 = icmp eq i32 %120, %27
  br i1 %121, label %28, label %59, !llvm.loop !15

122:                                              ; preds = %49, %7
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
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !9, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
