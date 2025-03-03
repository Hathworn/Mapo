; ModuleID = '../data/hip_kernels/2824/55/main.cu'
source_filename = "../data/hip_kernels/2824/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16simple_reductionPiS_iiE9local_mem = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16simple_reductionPiS_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = add nsw i32 %10, -1
  %15 = add i32 %14, %11
  %16 = icmp slt i32 %15, %2
  %17 = sub nsw i32 %2, %11
  %18 = select i1 %16, i32 %10, i32 %17
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %96

20:                                               ; preds = %4
  %21 = icmp slt i32 %13, %2
  %22 = sext i32 %13 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %12
  %25 = icmp eq i32 %12, 0
  %26 = icmp sgt i32 %18, 0
  %27 = and i32 %18, 7
  %28 = icmp ult i32 %18, 8
  %29 = and i32 %18, -8
  %30 = icmp eq i32 %27, 0
  br label %31

31:                                               ; preds = %20, %93
  %32 = phi i32 [ 0, %20 ], [ %94, %93 ]
  br i1 %21, label %33, label %35

33:                                               ; preds = %31
  %34 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7
  store i32 %34, i32 addrspace(3)* %24, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %33, %31
  br i1 %25, label %36, label %93

36:                                               ; preds = %35
  br i1 %26, label %37, label %90

37:                                               ; preds = %36
  br i1 %28, label %76, label %38

38:                                               ; preds = %37, %38
  %39 = phi i32 [ %72, %38 ], [ 0, %37 ]
  %40 = phi i32 [ %73, %38 ], [ 0, %37 ]
  %41 = phi i32 [ %74, %38 ], [ 0, %37 ]
  %42 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %40
  %43 = load i32, i32 addrspace(3)* %42, align 16, !tbaa !7
  %44 = add nsw i32 %43, %39
  %45 = or i32 %40, 1
  %46 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %44
  %49 = or i32 %40, 2
  %50 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 8, !tbaa !7
  %52 = add nsw i32 %51, %48
  %53 = or i32 %40, 3
  %54 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !7
  %56 = add nsw i32 %55, %52
  %57 = or i32 %40, 4
  %58 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 16, !tbaa !7
  %60 = add nsw i32 %59, %56
  %61 = or i32 %40, 5
  %62 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %61
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !7
  %64 = add nsw i32 %63, %60
  %65 = or i32 %40, 6
  %66 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 8, !tbaa !7
  %68 = add nsw i32 %67, %64
  %69 = or i32 %40, 7
  %70 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, %68
  %73 = add nuw nsw i32 %40, 8
  %74 = add i32 %41, 8
  %75 = icmp eq i32 %74, %29
  br i1 %75, label %76, label %38, !llvm.loop !11

76:                                               ; preds = %38, %37
  %77 = phi i32 [ undef, %37 ], [ %72, %38 ]
  %78 = phi i32 [ 0, %37 ], [ %72, %38 ]
  %79 = phi i32 [ 0, %37 ], [ %73, %38 ]
  br i1 %30, label %90, label %80

80:                                               ; preds = %76, %80
  %81 = phi i32 [ %86, %80 ], [ %78, %76 ]
  %82 = phi i32 [ %87, %80 ], [ %79, %76 ]
  %83 = phi i32 [ %88, %80 ], [ 0, %76 ]
  %84 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16simple_reductionPiS_iiE9local_mem, i32 0, i32 %82
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %85, %81
  %87 = add nuw nsw i32 %82, 1
  %88 = add i32 %83, 1
  %89 = icmp eq i32 %88, %27
  br i1 %89, label %90, label %80, !llvm.loop !13

90:                                               ; preds = %76, %80, %36
  %91 = phi i32 [ 0, %36 ], [ %77, %76 ], [ %86, %80 ]
  %92 = atomicrmw add i32 addrspace(1)* %0, i32 %91 syncscope("agent-one-as") monotonic, align 4
  br label %93

93:                                               ; preds = %35, %90
  %94 = add nuw nsw i32 %32, 1
  %95 = icmp eq i32 %94, %3
  br i1 %95, label %96, label %31, !llvm.loop !15

96:                                               ; preds = %93, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
