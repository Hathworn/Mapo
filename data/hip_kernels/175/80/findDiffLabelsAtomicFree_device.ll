; ModuleID = '../data/hip_kernels/175/80/main.cu'
source_filename = "../data/hip_kernels/175/80/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24findDiffLabelsAtomicFreePfiiiPiS0_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readnone %5) local_unnamed_addr #0 {
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
  br i1 %16, label %17, label %123

17:                                               ; preds = %6
  %18 = icmp sgt i32 %3, 0
  br i1 %18, label %19, label %47

19:                                               ; preds = %17
  %20 = and i32 %3, 7
  %21 = icmp ult i32 %3, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %3, -8
  br label %51

24:                                               ; preds = %51, %19
  %25 = phi i32 [ undef, %19 ], [ %117, %51 ]
  %26 = phi i32 [ %15, %19 ], [ %119, %51 ]
  %27 = phi float [ 1.000000e+07, %19 ], [ %118, %51 ]
  %28 = phi i32 [ 0, %19 ], [ %120, %51 ]
  %29 = phi i32 [ -1, %19 ], [ %117, %51 ]
  %30 = icmp eq i32 %20, 0
  br i1 %30, label %47, label %31

31:                                               ; preds = %24, %31
  %32 = phi i32 [ %43, %31 ], [ %26, %24 ]
  %33 = phi float [ %42, %31 ], [ %27, %24 ]
  %34 = phi i32 [ %44, %31 ], [ %28, %24 ]
  %35 = phi i32 [ %41, %31 ], [ %29, %24 ]
  %36 = phi i32 [ %45, %31 ], [ 0, %24 ]
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fcmp contract olt float %39, %33
  %41 = select i1 %40, i32 %34, i32 %35
  %42 = select i1 %40, float %39, float %33
  %43 = add nsw i32 %32, %1
  %44 = add nuw nsw i32 %34, 1
  %45 = add i32 %36, 1
  %46 = icmp eq i32 %45, %20
  br i1 %46, label %47, label %31, !llvm.loop !11

47:                                               ; preds = %24, %31, %17
  %48 = phi i32 [ -1, %17 ], [ %25, %24 ], [ %41, %31 ]
  %49 = sext i32 %15 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %49
  store i32 %48, i32 addrspace(1)* %50, align 4, !tbaa !13
  br label %123

51:                                               ; preds = %51, %22
  %52 = phi i32 [ %15, %22 ], [ %119, %51 ]
  %53 = phi float [ 1.000000e+07, %22 ], [ %118, %51 ]
  %54 = phi i32 [ 0, %22 ], [ %120, %51 ]
  %55 = phi i32 [ -1, %22 ], [ %117, %51 ]
  %56 = phi i32 [ 0, %22 ], [ %121, %51 ]
  %57 = sext i32 %52 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  %60 = fcmp contract olt float %59, %53
  %61 = select i1 %60, i32 %54, i32 %55
  %62 = select i1 %60, float %59, float %53
  %63 = add nsw i32 %52, %1
  %64 = or i32 %54, 1
  %65 = sext i32 %63 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fcmp contract olt float %67, %62
  %69 = select i1 %68, i32 %64, i32 %61
  %70 = select i1 %68, float %67, float %62
  %71 = add nsw i32 %63, %1
  %72 = or i32 %54, 2
  %73 = sext i32 %71 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7, !amdgpu.noclobber !5
  %76 = fcmp contract olt float %75, %70
  %77 = select i1 %76, i32 %72, i32 %69
  %78 = select i1 %76, float %75, float %70
  %79 = add nsw i32 %71, %1
  %80 = or i32 %54, 3
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = fcmp contract olt float %83, %78
  %85 = select i1 %84, i32 %80, i32 %77
  %86 = select i1 %84, float %83, float %78
  %87 = add nsw i32 %79, %1
  %88 = or i32 %54, 4
  %89 = sext i32 %87 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fcmp contract olt float %91, %86
  %93 = select i1 %92, i32 %88, i32 %85
  %94 = select i1 %92, float %91, float %86
  %95 = add nsw i32 %87, %1
  %96 = or i32 %54, 5
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fcmp contract olt float %99, %94
  %101 = select i1 %100, i32 %96, i32 %93
  %102 = select i1 %100, float %99, float %94
  %103 = add nsw i32 %95, %1
  %104 = or i32 %54, 6
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fcmp contract olt float %107, %102
  %109 = select i1 %108, i32 %104, i32 %101
  %110 = select i1 %108, float %107, float %102
  %111 = add nsw i32 %103, %1
  %112 = or i32 %54, 7
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fcmp contract olt float %115, %110
  %117 = select i1 %116, i32 %112, i32 %109
  %118 = select i1 %116, float %115, float %110
  %119 = add nsw i32 %111, %1
  %120 = add nuw nsw i32 %54, 8
  %121 = add i32 %56, 8
  %122 = icmp eq i32 %121, %23
  br i1 %122, label %24, label %51, !llvm.loop !15

123:                                              ; preds = %47, %6
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
