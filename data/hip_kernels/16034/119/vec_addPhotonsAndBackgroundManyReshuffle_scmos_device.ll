; ModuleID = '../data/hip_kernels/16034/119/main.cu'
source_filename = "../data/hip_kernels/16034/119/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_addPhotonsAndBackgroundManyReshuffle_scmos(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = udiv i32 %17, %14
  %27 = mul i32 %26, %14
  %28 = icmp ugt i32 %17, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %25
  %32 = add i32 %31, %9
  %33 = mul i32 %32, %14
  %34 = add i32 %33, %8
  %35 = icmp slt i32 %34, %0
  br i1 %35, label %36, label %70

36:                                               ; preds = %7
  %37 = freeze i32 %34
  %38 = freeze i32 %1
  %39 = sdiv i32 %37, %38
  %40 = freeze i32 %2
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %39, %38
  %43 = sub i32 %37, %42
  %44 = mul i32 %41, %40
  %45 = sub i32 %39, %44
  %46 = mul nsw i32 %2, %1
  %47 = sdiv i32 %0, %46
  %48 = mul i32 %47, %45
  %49 = add i32 %48, %41
  %50 = mul i32 %49, %1
  %51 = add i32 %50, %43
  %52 = sext i32 %34 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %4, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16, !amdgpu.noclobber !6
  %55 = shl nsw i32 %39, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %5, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16, !amdgpu.noclobber !6
  %59 = fmul contract double %54, %58
  %60 = add nuw nsw i32 %55, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %5, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !16, !amdgpu.noclobber !6
  %64 = fadd contract double %59, %63
  %65 = getelementptr inbounds double, double addrspace(1)* %6, i64 %52
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !16, !amdgpu.noclobber !6
  %67 = fadd contract double %64, %66
  %68 = sext i32 %51 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 %68
  store double %67, double addrspace(1)* %69, align 8, !tbaa !16
  br label %70

70:                                               ; preds = %36, %7
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
