; ModuleID = '../data/hip_kernels/2172/54/main.cu'
source_filename = "../data/hip_kernels/2172/54/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15upsample_kernelmPfiiiiiifS_(i64 %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !4
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !13, !invariant.load !14
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %11
  %28 = mul i32 %27, %20
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %29
  %31 = zext i32 %30 to i64
  %32 = icmp ult i64 %31, %0
  br i1 %32, label %33, label %82

33:                                               ; preds = %10
  %34 = mul nsw i32 %6, %2
  %35 = sext i32 %34 to i64
  %36 = freeze i64 %31
  %37 = freeze i64 %35
  %38 = udiv i64 %36, %37
  %39 = mul i64 %38, %37
  %40 = sub i64 %36, %39
  %41 = trunc i64 %40 to i32
  %42 = mul nsw i32 %6, %3
  %43 = sext i32 %42 to i64
  %44 = freeze i64 %43
  %45 = udiv i64 %38, %44
  %46 = mul i64 %45, %44
  %47 = sub i64 %38, %46
  %48 = trunc i64 %47 to i32
  %49 = sext i32 %4 to i64
  %50 = freeze i64 %49
  %51 = udiv i64 %45, %50
  %52 = mul i64 %51, %50
  %53 = sub i64 %45, %52
  %54 = trunc i64 %53 to i32
  %55 = sext i32 %5 to i64
  %56 = urem i64 %51, %55
  %57 = trunc i64 %56 to i32
  %58 = sdiv i32 %41, %6
  %59 = sdiv i32 %48, %6
  %60 = mul i32 %57, %4
  %61 = add i32 %60, %54
  %62 = mul i32 %61, %3
  %63 = add i32 %62, %59
  %64 = mul i32 %63, %2
  %65 = add i32 %64, %58
  %66 = icmp eq i32 %7, 0
  %67 = sext i32 %65 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  br i1 %66, label %76, label %69

69:                                               ; preds = %33
  %70 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !14
  %71 = fmul contract float %70, %8
  %72 = sext i32 %30 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %9, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16, !amdgpu.noclobber !14
  %75 = fadd contract float %74, %71
  store float %75, float addrspace(1)* %73, align 4, !tbaa !16
  br label %82

76:                                               ; preds = %33
  %77 = sext i32 %30 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %9, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16, !amdgpu.noclobber !14
  %80 = fmul contract float %79, %8
  %81 = atomicrmw fadd float addrspace(1)* %68, float %80 syncscope("agent-one-as") monotonic, align 4
  br label %82

82:                                               ; preds = %69, %76, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
