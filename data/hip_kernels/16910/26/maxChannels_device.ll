; ModuleID = '../data/hip_kernels/16910/26/main.cu'
source_filename = "../data/hip_kernels/16910/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z11maxChannelsPKdPKfS2_PKiPiS5_S5_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !4, !amdgpu.noclobber !8
  %18 = fptosi double %17 to i32
  %19 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %20 = load double, double addrspace(1)* %19, align 8, !tbaa !4, !amdgpu.noclobber !8
  %21 = fptosi double %20 to i32
  %22 = getelementptr inbounds double, double addrspace(1)* %0, i64 5
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !4, !amdgpu.noclobber !8
  %24 = fptrunc double %23 to float
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %28 = getelementptr i8, i8 addrspace(4)* %27, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !10, !invariant.load !8
  %31 = zext i16 %30 to i32
  %32 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 12
  %33 = bitcast i8 addrspace(4)* %32 to i32 addrspace(4)*
  %34 = load i32, i32 addrspace(4)* %33, align 4, !tbaa !11
  %35 = mul i32 %26, %31
  %36 = add i32 %35, %25
  %37 = add i32 %18, %21
  %38 = sub i32 %9, %37
  %39 = icmp slt i32 %36, %38
  br i1 %39, label %40, label %102

40:                                               ; preds = %7
  %41 = icmp sgt i32 %12, 0
  %42 = icmp sgt i32 %15, 1
  %43 = udiv i32 %34, %31
  %44 = mul i32 %43, %31
  %45 = icmp ugt i32 %34, %44
  %46 = zext i1 %45 to i32
  %47 = add i32 %43, %46
  %48 = mul i32 %47, %31
  br label %49

49:                                               ; preds = %40, %99
  %50 = phi i32 [ %36, %40 ], [ %100, %99 ]
  br i1 %41, label %51, label %99

51:                                               ; preds = %49, %96
  %52 = phi i32 [ %97, %96 ], [ 0, %49 ]
  %53 = mul nsw i32 %52, %15
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !20
  %57 = mul nsw i32 %56, %9
  %58 = add nsw i32 %57, %50
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !22
  %62 = fpext float %61 to double
  br i1 %42, label %65, label %78

63:                                               ; preds = %65
  %64 = icmp eq i32 %77, %15
  br i1 %64, label %78, label %65, !llvm.loop !24

65:                                               ; preds = %51, %63
  %66 = phi i32 [ %77, %63 ], [ 1, %51 ]
  %67 = add nsw i32 %66, %53
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !20
  %71 = mul nsw i32 %70, %9
  %72 = add nsw i32 %71, %50
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !22
  %76 = fcmp contract ogt float %75, %61
  %77 = add nuw nsw i32 %66, 1
  br i1 %76, label %96, label %63

78:                                               ; preds = %63, %51
  %79 = fcmp contract ogt float %61, %24
  br i1 %79, label %80, label %96

80:                                               ; preds = %78
  %81 = add nsw i32 %58, -1
  %82 = add i32 %81, %21
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !22
  %86 = fpext float %85 to double
  %87 = fadd contract double %62, 0xBEB0C6F7A0B5ED8D
  %88 = fcmp contract olt double %87, %86
  br i1 %88, label %89, label %96

89:                                               ; preds = %80
  %90 = atomicrmw add i32 addrspace(1)* %6, i32 1 syncscope("agent-one-as") monotonic, align 4
  %91 = icmp slt i32 %90, 10000
  br i1 %91, label %92, label %96

92:                                               ; preds = %89
  %93 = sext i32 %90 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %93
  store i32 %50, i32 addrspace(1)* %94, align 4, !tbaa !20
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %93
  store i32 %56, i32 addrspace(1)* %95, align 4, !tbaa !20
  br label %96

96:                                               ; preds = %65, %80, %92, %89, %78
  %97 = add nuw nsw i32 %52, 1
  %98 = icmp eq i32 %97, %12
  br i1 %98, label %99, label %51, !llvm.loop !26

99:                                               ; preds = %96, %49
  %100 = add i32 %48, %50
  %101 = icmp slt i32 %100, %38
  br i1 %101, label %49, label %102, !llvm.loop !27

102:                                              ; preds = %99, %7
  ret void
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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !6, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !25}
