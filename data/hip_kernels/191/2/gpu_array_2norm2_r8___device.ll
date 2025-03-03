; ModuleID = '../data/hip_kernels/191/2/main.cu'
source_filename = "../data/hip_kernels/191/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@thread_norms2_r8 = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21gpu_array_2norm2_r8__mPKdPd(i64 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %11
  %19 = mul i32 %16, %11
  %20 = zext i32 %19 to i64
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %18, %21
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %23, %0
  br i1 %24, label %25, label %34

25:                                               ; preds = %3, %25
  %26 = phi double [ %31, %25 ], [ 0.000000e+00, %3 ]
  %27 = phi i64 [ %32, %25 ], [ %23, %3 ]
  %28 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !16, !amdgpu.noclobber !14
  %30 = fmul contract double %29, %29
  %31 = fadd contract double %26, %30
  %32 = add i64 %27, %20
  %33 = icmp ult i64 %32, %0
  br i1 %33, label %25, label %34, !llvm.loop !20

34:                                               ; preds = %25, %3
  %35 = phi double [ 0.000000e+00, %3 ], [ %31, %25 ]
  %36 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %21
  store double %35, double addrspace(3)* %36, align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp eq i32 %21, 0
  br i1 %37, label %38, label %115

38:                                               ; preds = %34
  %39 = load double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 0), align 8, !tbaa !16
  %40 = zext i32 %17 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  store double %39, double addrspace(1)* %41, align 8, !tbaa !16
  %42 = zext i16 %10 to i64
  %43 = icmp ugt i16 %10, 1
  br i1 %43, label %44, label %115

44:                                               ; preds = %38
  %45 = add nsw i64 %42, -1
  %46 = add nsw i64 %42, -2
  %47 = and i64 %45, 7
  %48 = icmp ult i64 %46, 7
  br i1 %48, label %97, label %49

49:                                               ; preds = %44
  %50 = and i64 %45, -8
  br label %51

51:                                               ; preds = %51, %49
  %52 = phi double [ %39, %49 ], [ %93, %51 ]
  %53 = phi i64 [ 1, %49 ], [ %94, %51 ]
  %54 = phi i64 [ 0, %49 ], [ %95, %51 ]
  %55 = trunc i64 %53 to i32
  %56 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %55
  %57 = load double, double addrspace(3)* %56, align 8, !tbaa !16
  %58 = fadd contract double %57, %52
  %59 = trunc i64 %53 to i32
  %60 = add i32 %59, 1
  %61 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %60
  %62 = load double, double addrspace(3)* %61, align 8, !tbaa !16
  %63 = fadd contract double %62, %58
  %64 = trunc i64 %53 to i32
  %65 = add i32 %64, 2
  %66 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %65
  %67 = load double, double addrspace(3)* %66, align 8, !tbaa !16
  %68 = fadd contract double %67, %63
  %69 = trunc i64 %53 to i32
  %70 = add i32 %69, 3
  %71 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %70
  %72 = load double, double addrspace(3)* %71, align 8, !tbaa !16
  %73 = fadd contract double %72, %68
  %74 = trunc i64 %53 to i32
  %75 = add i32 %74, 4
  %76 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %75
  %77 = load double, double addrspace(3)* %76, align 8, !tbaa !16
  %78 = fadd contract double %77, %73
  %79 = trunc i64 %53 to i32
  %80 = add i32 %79, 5
  %81 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %80
  %82 = load double, double addrspace(3)* %81, align 8, !tbaa !16
  %83 = fadd contract double %82, %78
  %84 = trunc i64 %53 to i32
  %85 = add i32 %84, 6
  %86 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %85
  %87 = load double, double addrspace(3)* %86, align 8, !tbaa !16
  %88 = fadd contract double %87, %83
  %89 = trunc i64 %53 to i32
  %90 = add i32 %89, 7
  %91 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %90
  %92 = load double, double addrspace(3)* %91, align 8, !tbaa !16
  %93 = fadd contract double %92, %88
  %94 = add nuw nsw i64 %53, 8
  %95 = add i64 %54, 8
  %96 = icmp eq i64 %95, %50
  br i1 %96, label %97, label %51, !llvm.loop !22

97:                                               ; preds = %51, %44
  %98 = phi double [ undef, %44 ], [ %93, %51 ]
  %99 = phi double [ %39, %44 ], [ %93, %51 ]
  %100 = phi i64 [ 1, %44 ], [ %94, %51 ]
  %101 = icmp eq i64 %47, 0
  br i1 %101, label %113, label %102

102:                                              ; preds = %97, %102
  %103 = phi double [ %109, %102 ], [ %99, %97 ]
  %104 = phi i64 [ %110, %102 ], [ %100, %97 ]
  %105 = phi i64 [ %111, %102 ], [ 0, %97 ]
  %106 = trunc i64 %104 to i32
  %107 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @thread_norms2_r8, i32 0, i32 %106
  %108 = load double, double addrspace(3)* %107, align 8, !tbaa !16
  %109 = fadd contract double %108, %103
  %110 = add nuw nsw i64 %104, 1
  %111 = add i64 %105, 1
  %112 = icmp eq i64 %111, %47
  br i1 %112, label %113, label %102, !llvm.loop !23

113:                                              ; preds = %102, %97
  %114 = phi double [ %98, %97 ], [ %109, %102 ]
  store double %114, double addrspace(1)* %41, align 8, !tbaa !16
  br label %115

115:                                              ; preds = %38, %113, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
