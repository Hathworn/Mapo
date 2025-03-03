; ModuleID = '../data/hip_kernels/4596/2/main.cu'
source_filename = "../data/hip_kernels/4596/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6kernelPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %2, 1
  br i1 %13, label %14, label %36

14:                                               ; preds = %3
  %15 = add i32 %2, -1
  %16 = add i32 %2, -2
  %17 = and i32 %15, 7
  %18 = icmp ult i32 %16, 7
  br i1 %18, label %21, label %19

19:                                               ; preds = %14
  %20 = and i32 %15, -8
  br label %44

21:                                               ; preds = %44, %14
  %22 = phi i32 [ undef, %14 ], [ %73, %44 ]
  %23 = phi i32 [ %12, %14 ], [ %73, %44 ]
  %24 = phi i32 [ %12, %14 ], [ %67, %44 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %36, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %33, %26 ], [ %23, %21 ]
  %28 = phi i32 [ %30, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %34, %26 ], [ 0, %21 ]
  %30 = ashr i32 %28, 1
  %31 = shl i32 %27, 1
  %32 = and i32 %30, 1
  %33 = or i32 %31, %32
  %34 = add i32 %29, 1
  %35 = icmp eq i32 %34, %17
  br i1 %35, label %36, label %26, !llvm.loop !7

36:                                               ; preds = %21, %26, %3
  %37 = phi i32 [ %12, %3 ], [ %22, %21 ], [ %33, %26 ]
  %38 = and i32 %37, 255
  %39 = sext i32 %12 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !9, !amdgpu.noclobber !5
  %42 = zext i32 %38 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  store i32 %41, i32 addrspace(1)* %43, align 4, !tbaa !9
  ret void

44:                                               ; preds = %44, %19
  %45 = phi i32 [ %12, %19 ], [ %73, %44 ]
  %46 = phi i32 [ %12, %19 ], [ %67, %44 ]
  %47 = phi i32 [ 0, %19 ], [ %74, %44 ]
  %48 = lshr i32 %46, 4
  %49 = shl i32 %45, 4
  %50 = shl i32 %46, 2
  %51 = and i32 %50, 8
  %52 = or i32 %49, %51
  %53 = and i32 %46, 4
  %54 = or i32 %53, %52
  %55 = lshr i32 %46, 2
  %56 = and i32 %55, 2
  %57 = or i32 %54, %56
  %58 = and i32 %48, 1
  %59 = or i32 %57, %58
  %60 = lshr i32 %46, 6
  %61 = shl i32 %59, 2
  %62 = lshr i32 %46, 4
  %63 = and i32 %62, 2
  %64 = or i32 %61, %63
  %65 = and i32 %60, 1
  %66 = or i32 %64, %65
  %67 = ashr i32 %46, 8
  %68 = shl i32 %66, 2
  %69 = lshr i32 %46, 6
  %70 = and i32 %69, 2
  %71 = or i32 %68, %70
  %72 = and i32 %67, 1
  %73 = or i32 %71, %72
  %74 = add i32 %47, 8
  %75 = icmp eq i32 %74, %20
  br i1 %75, label %21, label %44, !llvm.loop !13
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
