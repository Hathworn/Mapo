; ModuleID = '../data/hip_kernels/324/154/main.cu'
source_filename = "../data/hip_kernels/324/154/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15kExtractPatchesPfS_S_S_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = mul i32 %12, %17
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = zext i32 %23 to i64
  %25 = udiv i32 %20, %17
  %26 = mul i32 %25, %17
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %17
  %31 = zext i32 %30 to i64
  %32 = mul i32 %8, %5
  %33 = mul i32 %32, %9
  %34 = mul i32 %33, %10
  %35 = sext i32 %34 to i64
  %36 = icmp ult i64 %24, %35
  br i1 %36, label %37, label %46

37:                                               ; preds = %11
  %38 = sext i32 %5 to i64
  %39 = sext i32 %8 to i64
  %40 = sext i32 %9 to i64
  %41 = sext i32 %10 to i64
  %42 = mul nsw i32 %7, %6
  %43 = mul nsw i32 %42, %10
  %44 = sext i32 %42 to i64
  %45 = sext i32 %6 to i64
  br label %47

46:                                               ; preds = %47, %11
  ret void

47:                                               ; preds = %37, %47
  %48 = phi i64 [ %24, %37 ], [ %86, %47 ]
  %49 = freeze i64 %48
  %50 = freeze i64 %38
  %51 = udiv i64 %49, %50
  %52 = mul i64 %51, %50
  %53 = sub i64 %49, %52
  %54 = freeze i64 %39
  %55 = udiv i64 %51, %54
  %56 = mul i64 %55, %54
  %57 = sub i64 %51, %56
  %58 = freeze i64 %40
  %59 = udiv i64 %55, %58
  %60 = mul i64 %59, %58
  %61 = sub i64 %55, %60
  %62 = urem i64 %59, %41
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fptosi float %64 to i32
  %66 = sext i32 %65 to i64
  %67 = add i64 %61, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16
  %70 = fptosi float %69 to i32
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fptosi float %73 to i32
  %75 = mul nsw i32 %43, %74
  %76 = sext i32 %75 to i64
  %77 = mul i64 %62, %44
  %78 = mul i64 %67, %45
  %79 = add i64 %77, %57
  %80 = add i64 %79, %71
  %81 = add i64 %80, %78
  %82 = add i64 %81, %76
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %84, float addrspace(1)* %85, align 4, !tbaa !16
  %86 = add i64 %48, %31
  %87 = icmp ult i64 %86, %35
  br i1 %87, label %47, label %46, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
