; ModuleID = '../data/hip_kernels/12683/2/main.cu'
source_filename = "../data/hip_kernels/12683/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7upscalePfS_liiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %12, %16
  %21 = add i32 %20, %10
  %22 = zext i32 %21 to i64
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %25 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 2, !range !5, !invariant.load !6
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %19, %16
  %30 = mul i32 %29, %16
  %31 = icmp ugt i32 %19, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %24, %16
  %35 = mul i32 %34, %28
  %36 = mul i32 %35, %33
  %37 = add i32 %36, %23
  %38 = zext i32 %37 to i64
  %39 = add nuw nsw i64 %38, %22
  %40 = icmp slt i64 %39, %2
  br i1 %40, label %41, label %73

41:                                               ; preds = %9
  %42 = trunc i64 %39 to i32
  %43 = freeze i32 %42
  %44 = freeze i32 %8
  %45 = sdiv i32 %43, %44
  %46 = mul i32 %45, %44
  %47 = sub i32 %43, %46
  %48 = freeze i32 %7
  %49 = sdiv i32 %45, %48
  %50 = mul i32 %49, %48
  %51 = sub i32 %45, %50
  %52 = freeze i32 %6
  %53 = sdiv i32 %49, %52
  %54 = mul i32 %53, %52
  %55 = sub i32 %49, %54
  %56 = freeze i32 %53
  %57 = sdiv i32 %47, %4
  %58 = sdiv i32 %51, %4
  %59 = sdiv i32 %55, %3
  %60 = sdiv i32 %6, %3
  %61 = sdiv i32 %7, %4
  %62 = sdiv i32 %8, %4
  %63 = mul nsw i32 %60, %56
  %64 = add nsw i32 %63, %59
  %65 = mul nsw i32 %64, %61
  %66 = add nsw i32 %65, %58
  %67 = mul nsw i32 %66, %62
  %68 = add nsw i32 %67, %57
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16, !amdgpu.noclobber !6
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  store float %71, float addrspace(1)* %72, align 4, !tbaa !16
  br label %73

73:                                               ; preds = %9, %41
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
