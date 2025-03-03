; ModuleID = '../data/hip_kernels/669/61/main.cu'
source_filename = "../data/hip_kernels/669/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24findDiffLabelsAtomicFreePfiiiPiS0_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %128

17:                                               ; preds = %6
  %18 = icmp sgt i32 %3, 0
  br i1 %18, label %19, label %47

19:                                               ; preds = %17
  %20 = and i32 %3, 7
  %21 = icmp ult i32 %3, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %3, -8
  br label %53

24:                                               ; preds = %53, %19
  %25 = phi i32 [ undef, %19 ], [ %119, %53 ]
  %26 = phi i32 [ %15, %19 ], [ %121, %53 ]
  %27 = phi float [ 1.000000e+07, %19 ], [ %120, %53 ]
  %28 = phi i32 [ -1, %19 ], [ %119, %53 ]
  %29 = phi i32 [ 0, %19 ], [ %122, %53 ]
  %30 = icmp eq i32 %20, 0
  br i1 %30, label %47, label %31

31:                                               ; preds = %24, %31
  %32 = phi i32 [ %43, %31 ], [ %26, %24 ]
  %33 = phi float [ %42, %31 ], [ %27, %24 ]
  %34 = phi i32 [ %41, %31 ], [ %28, %24 ]
  %35 = phi i32 [ %44, %31 ], [ %29, %24 ]
  %36 = phi i32 [ %45, %31 ], [ 0, %24 ]
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fcmp contract olt float %39, %33
  %41 = select i1 %40, i32 %35, i32 %34
  %42 = select i1 %40, float %39, float %33
  %43 = add nsw i32 %32, %1
  %44 = add nuw nsw i32 %35, 1
  %45 = add i32 %36, 1
  %46 = icmp eq i32 %45, %20
  br i1 %46, label %47, label %31, !llvm.loop !11

47:                                               ; preds = %24, %31, %17
  %48 = phi i32 [ -1, %17 ], [ %25, %24 ], [ %41, %31 ]
  %49 = sext i32 %15 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !13, !amdgpu.noclobber !5
  store i32 %48, i32 addrspace(1)* %50, align 4, !tbaa !13
  %52 = icmp eq i32 %48, %51
  br i1 %52, label %128, label %125

53:                                               ; preds = %53, %22
  %54 = phi i32 [ %15, %22 ], [ %121, %53 ]
  %55 = phi float [ 1.000000e+07, %22 ], [ %120, %53 ]
  %56 = phi i32 [ -1, %22 ], [ %119, %53 ]
  %57 = phi i32 [ 0, %22 ], [ %122, %53 ]
  %58 = phi i32 [ 0, %22 ], [ %123, %53 ]
  %59 = sext i32 %54 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = fcmp contract olt float %61, %55
  %63 = select i1 %62, i32 %57, i32 %56
  %64 = select i1 %62, float %61, float %55
  %65 = add nsw i32 %54, %1
  %66 = or i32 %57, 1
  %67 = sext i32 %65 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fcmp contract olt float %69, %64
  %71 = select i1 %70, i32 %66, i32 %63
  %72 = select i1 %70, float %69, float %64
  %73 = add nsw i32 %65, %1
  %74 = or i32 %57, 2
  %75 = sext i32 %73 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fcmp contract olt float %77, %72
  %79 = select i1 %78, i32 %74, i32 %71
  %80 = select i1 %78, float %77, float %72
  %81 = add nsw i32 %73, %1
  %82 = or i32 %57, 3
  %83 = sext i32 %81 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fcmp contract olt float %85, %80
  %87 = select i1 %86, i32 %82, i32 %79
  %88 = select i1 %86, float %85, float %80
  %89 = add nsw i32 %81, %1
  %90 = or i32 %57, 4
  %91 = sext i32 %89 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fcmp contract olt float %93, %88
  %95 = select i1 %94, i32 %90, i32 %87
  %96 = select i1 %94, float %93, float %88
  %97 = add nsw i32 %89, %1
  %98 = or i32 %57, 5
  %99 = sext i32 %97 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = fcmp contract olt float %101, %96
  %103 = select i1 %102, i32 %98, i32 %95
  %104 = select i1 %102, float %101, float %96
  %105 = add nsw i32 %97, %1
  %106 = or i32 %57, 6
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = fcmp contract olt float %109, %104
  %111 = select i1 %110, i32 %106, i32 %103
  %112 = select i1 %110, float %109, float %104
  %113 = add nsw i32 %105, %1
  %114 = or i32 %57, 7
  %115 = sext i32 %113 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fcmp contract olt float %117, %112
  %119 = select i1 %118, i32 %114, i32 %111
  %120 = select i1 %118, float %117, float %112
  %121 = add nsw i32 %113, %1
  %122 = add nuw nsw i32 %57, 8
  %123 = add i32 %58, 8
  %124 = icmp eq i32 %123, %23
  br i1 %124, label %24, label %53, !llvm.loop !15

125:                                              ; preds = %47
  %126 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !13
  %127 = add nsw i32 %126, 1
  store i32 %127, i32 addrspace(1)* %5, align 4, !tbaa !13
  br label %128

128:                                              ; preds = %47, %125, %6
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
