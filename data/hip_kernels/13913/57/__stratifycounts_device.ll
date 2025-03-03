; ModuleID = '../data/hip_kernels/13913/57/main.cu'
source_filename = "../data/hip_kernels/13913/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16__stratifycountsPdiS_PjE2ic = internal addrspace(3) global [256 x [4 x i32]] undef, align 16
@_ZZ16__stratifycountsPdiS_PjE2ss = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16__stratifycountsPdiS_Pj(double addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = zext i32 %5 to i64
  %7 = sext i32 %1 to i64
  %8 = mul nsw i64 %7, %6
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = zext i32 %21 to i64
  %23 = sdiv i64 %8, %22
  %24 = trunc i64 %23 to i32
  %25 = add i32 %5, 1
  %26 = zext i32 %25 to i64
  %27 = mul nsw i64 %7, %26
  %28 = sdiv i64 %27, %22
  %29 = trunc i64 %28 to i32
  %30 = sdiv i32 %24, 4096
  %31 = add i32 %30, %5
  %32 = shl i32 %31, 8
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %35 = mul nuw nsw i32 %34, %16
  %36 = add nuw nsw i32 %35, %33
  %37 = icmp eq i32 %34, 0
  br i1 %37, label %38, label %43

38:                                               ; preds = %4
  %39 = zext i32 %33 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16, !amdgpu.noclobber !14
  %42 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %33
  store double %41, double addrspace(3)* %42, align 8, !tbaa !16
  br label %43

43:                                               ; preds = %38, %4
  %44 = icmp slt i32 %24, %29
  br i1 %44, label %45, label %52

45:                                               ; preds = %43
  %46 = icmp ult i32 %34, 4
  %47 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %33, i32 %34
  %48 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %33, i32 0
  %49 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %33, i32 1
  %50 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %33, i32 2
  %51 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %33, i32 3
  br label %53

52:                                               ; preds = %129, %43
  ret void

53:                                               ; preds = %45, %129
  %54 = phi i32 [ %32, %45 ], [ %130, %129 ]
  %55 = phi i32 [ %24, %45 ], [ %131, %129 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %56, label %57

56:                                               ; preds = %53
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !20
  br label %57

57:                                               ; preds = %56, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = add nsw i32 %36, %55
  %59 = add nsw i32 %58, 4096
  %60 = tail call i32 @llvm.smin.i32(i32 %29, i32 %59)
  %61 = icmp slt i32 %58, %60
  br i1 %61, label %62, label %64

62:                                               ; preds = %57
  %63 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 0), align 16, !tbaa !16
  br label %65

64:                                               ; preds = %65, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %37, label %118, label %129

65:                                               ; preds = %62, %65
  %66 = phi i32 [ %58, %62 ], [ %116, %65 ]
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !16
  %70 = fcmp contract ogt double %69, %63
  %71 = select i1 %70, i32 2, i32 1
  %72 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %71
  %73 = load double, double addrspace(3)* %72, align 8, !tbaa !16
  %74 = fcmp contract ogt double %69, %73
  %75 = shl nuw nsw i32 %71, 1
  %76 = select i1 %74, i32 2, i32 1
  %77 = add nuw nsw i32 %75, %76
  %78 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %77
  %79 = load double, double addrspace(3)* %78, align 8, !tbaa !16
  %80 = fcmp contract ogt double %69, %79
  %81 = shl nuw nsw i32 %77, 1
  %82 = select i1 %80, i32 2, i32 1
  %83 = add nuw nsw i32 %81, %82
  %84 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %83
  %85 = load double, double addrspace(3)* %84, align 8, !tbaa !16
  %86 = fcmp contract ogt double %69, %85
  %87 = shl nuw nsw i32 %83, 1
  %88 = select i1 %86, i32 2, i32 1
  %89 = add nuw nsw i32 %87, %88
  %90 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %89
  %91 = load double, double addrspace(3)* %90, align 8, !tbaa !16
  %92 = fcmp contract ogt double %69, %91
  %93 = shl nuw nsw i32 %89, 1
  %94 = select i1 %92, i32 2, i32 1
  %95 = add nuw nsw i32 %93, %94
  %96 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %95
  %97 = load double, double addrspace(3)* %96, align 8, !tbaa !16
  %98 = fcmp contract ogt double %69, %97
  %99 = shl nuw nsw i32 %95, 1
  %100 = select i1 %98, i32 2, i32 1
  %101 = add nuw nsw i32 %99, %100
  %102 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %101
  %103 = load double, double addrspace(3)* %102, align 8, !tbaa !16
  %104 = fcmp contract ogt double %69, %103
  %105 = shl nuw nsw i32 %101, 1
  %106 = select i1 %104, i32 2, i32 1
  %107 = add nuw nsw i32 %105, %106
  %108 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ss, i32 0, i32 %107
  %109 = load double, double addrspace(3)* %108, align 8, !tbaa !16
  %110 = fcmp contract ogt double %69, %109
  %111 = shl nuw nsw i32 %107, 1
  %112 = select i1 %110, i32 -253, i32 -254
  %113 = add nsw i32 %112, %111
  %114 = getelementptr inbounds [256 x [4 x i32]], [256 x [4 x i32]] addrspace(3)* @_ZZ16__stratifycountsPdiS_PjE2ic, i32 0, i32 %113, i32 %34
  %115 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* %114, i32 2147418112, i32 2, i32 4, i1 false)
  %116 = add nsw i32 %66, 1024
  %117 = icmp slt i32 %116, %60
  br i1 %117, label %65, label %64, !llvm.loop !22

118:                                              ; preds = %64
  %119 = load i32, i32 addrspace(3)* %48, align 16, !tbaa !20
  %120 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !20
  %121 = add i32 %120, %119
  %122 = load i32, i32 addrspace(3)* %50, align 8, !tbaa !20
  %123 = add i32 %121, %122
  %124 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !20
  %125 = add i32 %123, %124
  %126 = add i32 %54, %33
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %127
  store i32 %125, i32 addrspace(1)* %128, align 4, !tbaa !20
  br label %129

129:                                              ; preds = %118, %64
  %130 = add nsw i32 %54, 256
  %131 = add nsw i32 %55, 4096
  %132 = icmp slt i32 %131, %29
  br i1 %132, label %53, label %52, !llvm.loop !24
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nounwind willreturn }

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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
