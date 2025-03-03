; ModuleID = '../data/hip_kernels/1213/32/main.cu'
source_filename = "../data/hip_kernels/1213/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z14bp_output_convPfS_S_iiiiibb(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i1 %8, i1 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = udiv i32 %19, %16
  %24 = mul i32 %23, %16
  %25 = icmp ugt i32 %19, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %16
  %29 = mul i32 %4, %3
  %30 = mul i32 %7, %6
  %31 = mul i32 %30, %29
  %32 = mul i32 %31, %29
  %33 = add nsw i32 %4, -1
  %34 = sdiv i32 %33, 2
  %35 = mul nsw i32 %22, %32
  %36 = sdiv i32 %35, %28
  %37 = add nsw i32 %22, 1
  %38 = mul nsw i32 %37, %32
  %39 = sdiv i32 %38, %28
  %40 = icmp slt i32 %36, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %10
  %42 = mul i32 %34, -2
  %43 = sub nsw i32 0, %34
  %44 = select i1 %9, i32 %43, i32 %42
  %45 = sub nsw i32 0, %34
  %46 = select i1 %9, i32 %45, i32 %42
  br label %48

47:                                               ; preds = %107, %10
  ret void

48:                                               ; preds = %41, %107
  %49 = phi i32 [ %36, %41 ], [ %108, %107 ]
  %50 = freeze i32 %49
  %51 = freeze i32 %30
  %52 = sdiv i32 %50, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %50, %53
  %55 = freeze i32 %4
  %56 = sdiv i32 %52, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %52, %57
  %59 = freeze i32 %4
  %60 = sdiv i32 %56, %59
  %61 = mul i32 %60, %59
  %62 = sub i32 %56, %61
  %63 = freeze i32 %3
  %64 = sdiv i32 %60, %63
  %65 = mul i32 %64, %63
  %66 = sub i32 %60, %65
  %67 = srem i32 %64, %3
  %68 = add nsw i32 %66, %58
  %69 = add nsw i32 %67, %62
  %70 = add i32 %69, %44
  %71 = add i32 %68, %46
  %72 = icmp sgt i32 %71, -1
  br i1 %72, label %73, label %107

73:                                               ; preds = %48
  %74 = icmp slt i32 %71, %5
  %75 = icmp sgt i32 %70, -1
  %76 = select i1 %74, i1 %75, i1 false
  %77 = icmp slt i32 %70, %5
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %107

79:                                               ; preds = %73
  %80 = srem i32 %54, %6
  %81 = mul nsw i32 %80, %3
  %82 = add nsw i32 %81, %67
  %83 = mul nsw i32 %82, %3
  %84 = add nsw i32 %83, %66
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = mul nsw i32 %54, %4
  %88 = add i32 %87, %33
  %89 = sub i32 %88, %62
  %90 = mul nsw i32 %89, %4
  %91 = xor i32 %58, -1
  %92 = add i32 %91, %4
  %93 = add i32 %92, %90
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = srem i32 %54, %7
  %98 = mul nsw i32 %97, %5
  %99 = add nsw i32 %98, %70
  %100 = mul nsw i32 %99, %5
  %101 = add nsw i32 %100, %71
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  %105 = fmul contract float %96, %104
  %106 = atomicrmw fadd float addrspace(1)* %86, float %105 syncscope("agent-one-as") monotonic, align 4
  br label %107

107:                                              ; preds = %79, %73, %48
  %108 = add nsw i32 %49, 1
  %109 = icmp slt i32 %108, %39
  br i1 %109, label %48, label %47, !llvm.loop !20
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
