; ModuleID = '../data/hip_kernels/59/13/main.cu'
source_filename = "../data/hip_kernels/59/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9kContractPfS_iiiiiiiiiiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = add i32 %18, %15
  %20 = freeze i32 %19
  %21 = freeze i32 %7
  %22 = sdiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = mul nsw i32 %24, %13
  %26 = add nsw i32 %25, %11
  %27 = mul nsw i32 %22, %12
  %28 = add nsw i32 %27, %10
  %29 = mul i32 %17, %2
  %30 = mul i32 %29, %4
  %31 = mul i32 %30, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = mul i32 %17, %8
  %35 = mul i32 %34, %9
  %36 = mul i32 %35, %14
  %37 = add nsw i32 %36, %18
  %38 = mul nsw i32 %37, %2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = icmp sgt i32 %8, 0
  br i1 %41, label %42, label %50

42:                                               ; preds = %16
  %43 = icmp sgt i32 %9, 0
  %44 = mul nsw i32 %14, %2
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %46 = icmp sge i32 %45, %2
  %47 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %48 = getelementptr i8, i8 addrspace(4)* %47, i64 4
  %49 = bitcast i8 addrspace(4)* %48 to i16 addrspace(4)*
  br label %51

50:                                               ; preds = %59, %16
  ret void

51:                                               ; preds = %42, %59
  %52 = phi i32 [ 0, %42 ], [ %60, %59 ]
  %53 = add nsw i32 %28, %52
  br i1 %43, label %54, label %59

54:                                               ; preds = %51
  %55 = mul nsw i32 %52, %9
  %56 = mul nsw i32 %53, %5
  %57 = icmp slt i32 %53, 0
  %58 = icmp sge i32 %53, %4
  br label %62

59:                                               ; preds = %91, %51
  %60 = add nuw nsw i32 %52, 1
  %61 = icmp eq i32 %60, %8
  br i1 %61, label %50, label %51, !llvm.loop !4

62:                                               ; preds = %54, %91
  %63 = phi i32 [ 0, %54 ], [ %92, %91 ]
  %64 = add nsw i32 %26, %63
  %65 = add nsw i32 %63, %55
  %66 = mul nsw i32 %44, %65
  %67 = sext i32 %66 to i64
  %68 = add nsw i32 %64, %56
  %69 = mul nsw i32 %68, %2
  %70 = sext i32 %69 to i64
  %71 = icmp slt i32 %64, 0
  br i1 %71, label %91, label %72

72:                                               ; preds = %62
  %73 = icmp sge i32 %64, %5
  %74 = select i1 %73, i1 true, i1 %57
  %75 = select i1 %74, i1 true, i1 %58
  %76 = select i1 %75, i1 true, i1 %46
  br i1 %76, label %91, label %77

77:                                               ; preds = %72
  %78 = load i16, i16 addrspace(4)* %49, align 4, !range !6, !invariant.load !7
  %79 = zext i16 %78 to i32
  br label %80

80:                                               ; preds = %77, %80
  %81 = phi i32 [ %45, %77 ], [ %89, %80 ]
  %82 = sext i32 %81 to i64
  %83 = add nsw i64 %82, %70
  %84 = getelementptr inbounds float, float addrspace(1)* %33, i64 %83
  %85 = add nsw i64 %82, %67
  %86 = getelementptr inbounds float, float addrspace(1)* %40, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !8
  %88 = atomicrmw fadd float addrspace(1)* %84, float %87 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = add i32 %81, %79
  %90 = icmp slt i32 %89, %2
  br i1 %90, label %80, label %91, !llvm.loop !12

91:                                               ; preds = %80, %72, %62
  %92 = add nuw nsw i32 %63, 1
  %93 = icmp eq i32 %92, %9
  br i1 %93, label %59, label %62, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{i16 1, i16 1025}
!7 = !{}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !5}
!13 = distinct !{!13, !5}
