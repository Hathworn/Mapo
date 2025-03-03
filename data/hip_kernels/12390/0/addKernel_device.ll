; ModuleID = '../data/hip_kernels/12390/0/main.cu'
source_filename = "../data/hip_kernels/12390/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = hidden local_unnamed_addr addrspace(3) global [101 x i32] undef, align 16

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z9addKernelPiS_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  store i32 %11, i32 addrspace(1)* %13, align 4, !tbaa !7
  %14 = icmp slt i32 %11, 102
  br i1 %14, label %15, label %73

15:                                               ; preds = %2
  %16 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %10
  store i32 %11, i32 addrspace(3)* %16, align 4, !tbaa !7
  %17 = icmp eq i32 %10, 0
  br i1 %17, label %18, label %73

18:                                               ; preds = %15
  %19 = add nuw nsw i32 %8, 1
  %20 = and i32 %19, 7
  %21 = icmp ult i16 %7, 7
  br i1 %21, label %61, label %22

22:                                               ; preds = %18
  %23 = and i32 %19, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %58, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %59, %24 ]
  %27 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %25
  %28 = load i32, i32 addrspace(3)* %27, align 16, !tbaa !7
  %29 = atomicrmw add i32 addrspace(1)* %1, i32 %28 syncscope("agent-one-as") monotonic, align 4
  %30 = or i32 %25, 1
  %31 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %30
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %33 = atomicrmw add i32 addrspace(1)* %1, i32 %32 syncscope("agent-one-as") monotonic, align 4
  %34 = or i32 %25, 2
  %35 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !7
  %37 = atomicrmw add i32 addrspace(1)* %1, i32 %36 syncscope("agent-one-as") monotonic, align 4
  %38 = or i32 %25, 3
  %39 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = atomicrmw add i32 addrspace(1)* %1, i32 %40 syncscope("agent-one-as") monotonic, align 4
  %42 = or i32 %25, 4
  %43 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 16, !tbaa !7
  %45 = atomicrmw add i32 addrspace(1)* %1, i32 %44 syncscope("agent-one-as") monotonic, align 4
  %46 = or i32 %25, 5
  %47 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %46
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !7
  %49 = atomicrmw add i32 addrspace(1)* %1, i32 %48 syncscope("agent-one-as") monotonic, align 4
  %50 = or i32 %25, 6
  %51 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 8, !tbaa !7
  %53 = atomicrmw add i32 addrspace(1)* %1, i32 %52 syncscope("agent-one-as") monotonic, align 4
  %54 = or i32 %25, 7
  %55 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %54
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !7
  %57 = atomicrmw add i32 addrspace(1)* %1, i32 %56 syncscope("agent-one-as") monotonic, align 4
  %58 = add nuw nsw i32 %25, 8
  %59 = add i32 %26, 8
  %60 = icmp eq i32 %59, %23
  br i1 %60, label %61, label %24, !llvm.loop !11

61:                                               ; preds = %24, %18
  %62 = phi i32 [ 0, %18 ], [ %58, %24 ]
  %63 = icmp eq i32 %20, 0
  br i1 %63, label %73, label %64

64:                                               ; preds = %61, %64
  %65 = phi i32 [ %70, %64 ], [ %62, %61 ]
  %66 = phi i32 [ %71, %64 ], [ 0, %61 ]
  %67 = getelementptr inbounds [101 x i32], [101 x i32] addrspace(3)* @temp, i32 0, i32 %65
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !7
  %69 = atomicrmw add i32 addrspace(1)* %1, i32 %68 syncscope("agent-one-as") monotonic, align 4
  %70 = add nuw nsw i32 %65, 1
  %71 = add i32 %66, 1
  %72 = icmp eq i32 %71, %20
  br i1 %72, label %73, label %64, !llvm.loop !13

73:                                               ; preds = %61, %64, %15, %2
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
