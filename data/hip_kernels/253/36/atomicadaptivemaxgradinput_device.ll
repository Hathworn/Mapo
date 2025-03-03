; ModuleID = '../data/hip_kernels/253/36/main.cu'
source_filename = "../data/hip_kernels/253/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z26atomicadaptivemaxgradinputPfS_S_S_iiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 8, !tbaa !7
  %25 = mul i32 %17, %21
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %27 = add i32 %25, %26
  %28 = udiv i32 %24, %21
  %29 = mul i32 %28, %21
  %30 = icmp ugt i32 %24, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %21
  %34 = mul i32 %10, %7
  %35 = mul i32 %34, %8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = mul i32 %10, %5
  %39 = mul i32 %38, %6
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %44 = icmp slt i32 %27, %7
  br i1 %44, label %45, label %97

45:                                               ; preds = %9
  %46 = sitofp i32 %7 to float
  %47 = sitofp i32 %5 to float
  %48 = icmp slt i32 %11, %8
  %49 = sitofp i32 %8 to float
  %50 = sitofp i32 %6 to float
  br label %51

51:                                               ; preds = %45, %94
  %52 = phi i32 [ %27, %45 ], [ %95, %94 ]
  br i1 %48, label %53, label %94

53:                                               ; preds = %51
  %54 = sitofp i32 %52 to float
  %55 = fdiv contract float %54, %46
  %56 = fmul contract float %55, %47
  %57 = tail call float @llvm.floor.f32(float %56)
  %58 = fptosi float %57 to i32
  %59 = mul nsw i32 %58, %6
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %41, i64 %60
  %62 = mul nsw i32 %52, %8
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %37, i64 %63
  %65 = getelementptr inbounds float, float addrspace(1)* %42, i64 %63
  %66 = getelementptr inbounds float, float addrspace(1)* %43, i64 %63
  br label %67

67:                                               ; preds = %53, %67
  %68 = phi i32 [ %11, %53 ], [ %92, %67 ]
  %69 = sitofp i32 %68 to float
  %70 = fdiv contract float %69, %49
  %71 = fmul contract float %70, %50
  %72 = tail call float @llvm.floor.f32(float %71)
  %73 = fptosi float %72 to i32
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %61, i64 %74
  %76 = zext i32 %68 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %64, i64 %76
  %78 = getelementptr inbounds float, float addrspace(1)* %65, i64 %76
  %79 = getelementptr inbounds float, float addrspace(1)* %66, i64 %76
  %80 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %81 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %82 = fadd contract float %81, -1.000000e+00
  %83 = fptosi float %82 to i32
  %84 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %85 = fadd contract float %84, -1.000000e+00
  %86 = fptosi float %85 to i32
  %87 = mul nsw i32 %86, %6
  %88 = add nsw i32 %87, %83
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %75, i64 %89
  %91 = atomicrmw fadd float addrspace(1)* %90, float %80 syncscope("agent-one-as") monotonic, align 4
  %92 = add nuw nsw i32 %68, %16
  %93 = icmp slt i32 %92, %8
  br i1 %93, label %67, label %94, !llvm.loop !20

94:                                               ; preds = %67, %51
  %95 = add nsw i32 %52, %33
  %96 = icmp slt i32 %95, %7
  br i1 %96, label %51, label %97, !llvm.loop !22

97:                                               ; preds = %94, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !12, i64 16}
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
