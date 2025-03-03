; ModuleID = '../data/hip_kernels/1213/5/main.cu'
source_filename = "../data/hip_kernels/1213/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z7fp_convPfS_S_iiiiib(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i1 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = mul i32 %10, %15
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = udiv i32 %18, %15
  %23 = mul i32 %22, %15
  %24 = icmp ugt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %15
  %28 = mul i32 %5, %3
  %29 = mul i32 %7, %6
  %30 = mul i32 %29, %28
  %31 = mul i32 %30, %28
  %32 = add nsw i32 %3, -1
  %33 = sdiv i32 %32, -2
  %34 = mul nsw i32 %21, %31
  %35 = sdiv i32 %34, %27
  %36 = add nsw i32 %21, 1
  %37 = mul nsw i32 %36, %31
  %38 = sdiv i32 %37, %27
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %9
  %41 = select i1 %8, i32 %33, i32 0
  br label %43

42:                                               ; preds = %101, %9
  ret void

43:                                               ; preds = %40, %101
  %44 = phi i32 [ %102, %101 ], [ %35, %40 ]
  %45 = freeze i32 %44
  %46 = freeze i32 %3
  %47 = sdiv i32 %45, %46
  %48 = mul i32 %47, %46
  %49 = sub i32 %45, %48
  %50 = freeze i32 %3
  %51 = sdiv i32 %47, %50
  %52 = mul i32 %51, %50
  %53 = sub i32 %47, %52
  %54 = freeze i32 %29
  %55 = sdiv i32 %51, %54
  %56 = mul i32 %55, %54
  %57 = sub i32 %51, %56
  %58 = freeze i32 %5
  %59 = sdiv i32 %55, %58
  %60 = mul i32 %59, %58
  %61 = sub i32 %55, %60
  %62 = srem i32 %59, %5
  %63 = add nsw i32 %61, %49
  %64 = add nsw i32 %62, %53
  %65 = add i32 %64, %33
  %66 = add nsw i32 %62, %53
  %67 = add i32 %63, %41
  %68 = select i1 %8, i32 %65, i32 %66
  %69 = icmp sgt i32 %67, -1
  br i1 %69, label %70, label %101

70:                                               ; preds = %43
  %71 = icmp slt i32 %67, %4
  %72 = icmp sgt i32 %68, -1
  %73 = select i1 %71, i1 %72, i1 false
  %74 = icmp slt i32 %68, %4
  %75 = select i1 %73, i1 %74, i1 false
  br i1 %75, label %76, label %101

76:                                               ; preds = %70
  %77 = srem i32 %57, %7
  %78 = mul nsw i32 %77, %5
  %79 = add nsw i32 %78, %62
  %80 = mul nsw i32 %79, %5
  %81 = add nsw i32 %80, %61
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = mul nsw i32 %57, %3
  %85 = add nsw i32 %84, %53
  %86 = mul nsw i32 %85, %3
  %87 = add nsw i32 %86, %49
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16
  %91 = srem i32 %57, %6
  %92 = mul nsw i32 %91, %4
  %93 = add nsw i32 %92, %68
  %94 = mul nsw i32 %93, %4
  %95 = add nsw i32 %94, %67
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = fmul contract float %90, %98
  %100 = atomicrmw fadd float addrspace(1)* %83, float %99 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %76, %70, %43
  %102 = add nsw i32 %44, 1
  %103 = icmp slt i32 %102, %38
  br i1 %103, label %43, label %42, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
