; ModuleID = '../data/hip_kernels/7184/1/main.cu'
source_filename = "../data/hip_kernels/7184/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22minimumClusterDistanceiPdPiii(i32 %0, double addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = add i32 %14, 1
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = icmp eq i32 %15, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %5
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  br label %28

24:                                               ; preds = %5
  %25 = urem i32 %3, %10
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = icmp ugt i32 %25, %26
  br i1 %27, label %28, label %156

28:                                               ; preds = %22, %24
  %29 = phi i32 [ %23, %22 ], [ %26, %24 ]
  %30 = mul i32 %14, %0
  %31 = add i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %34, label %153

34:                                               ; preds = %28
  %35 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !5
  %37 = and i32 %4, 7
  %38 = icmp ult i32 %4, 8
  br i1 %38, label %128, label %39

39:                                               ; preds = %34
  %40 = and i32 %4, -8
  br label %41

41:                                               ; preds = %41, %39
  %42 = phi i32 [ 0, %39 ], [ %125, %41 ]
  %43 = phi double [ undef, %39 ], [ %124, %41 ]
  %44 = phi double [ %36, %39 ], [ %123, %41 ]
  %45 = phi i32 [ 0, %39 ], [ %126, %41 ]
  %46 = mul nsw i32 %42, %3
  %47 = add nsw i32 %46, %31
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !16, !amdgpu.noclobber !5
  %51 = fcmp contract olt double %50, %44
  %52 = sitofp i32 %42 to double
  %53 = select i1 %51, double %50, double %44
  %54 = select i1 %51, double %52, double %43
  %55 = or i32 %42, 1
  %56 = mul nsw i32 %55, %3
  %57 = add nsw i32 %56, %31
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !16, !amdgpu.noclobber !5
  %61 = fcmp contract olt double %60, %53
  %62 = sitofp i32 %55 to double
  %63 = select i1 %61, double %60, double %53
  %64 = select i1 %61, double %62, double %54
  %65 = or i32 %42, 2
  %66 = mul nsw i32 %65, %3
  %67 = add nsw i32 %66, %31
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !16, !amdgpu.noclobber !5
  %71 = fcmp contract olt double %70, %63
  %72 = sitofp i32 %65 to double
  %73 = select i1 %71, double %70, double %63
  %74 = select i1 %71, double %72, double %64
  %75 = or i32 %42, 3
  %76 = mul nsw i32 %75, %3
  %77 = add nsw i32 %76, %31
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !16, !amdgpu.noclobber !5
  %81 = fcmp contract olt double %80, %73
  %82 = sitofp i32 %75 to double
  %83 = select i1 %81, double %80, double %73
  %84 = select i1 %81, double %82, double %74
  %85 = or i32 %42, 4
  %86 = mul nsw i32 %85, %3
  %87 = add nsw i32 %86, %31
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !16, !amdgpu.noclobber !5
  %91 = fcmp contract olt double %90, %83
  %92 = sitofp i32 %85 to double
  %93 = select i1 %91, double %90, double %83
  %94 = select i1 %91, double %92, double %84
  %95 = or i32 %42, 5
  %96 = mul nsw i32 %95, %3
  %97 = add nsw i32 %96, %31
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !16, !amdgpu.noclobber !5
  %101 = fcmp contract olt double %100, %93
  %102 = sitofp i32 %95 to double
  %103 = select i1 %101, double %100, double %93
  %104 = select i1 %101, double %102, double %94
  %105 = or i32 %42, 6
  %106 = mul nsw i32 %105, %3
  %107 = add nsw i32 %106, %31
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !16, !amdgpu.noclobber !5
  %111 = fcmp contract olt double %110, %103
  %112 = sitofp i32 %105 to double
  %113 = select i1 %111, double %110, double %103
  %114 = select i1 %111, double %112, double %104
  %115 = or i32 %42, 7
  %116 = mul nsw i32 %115, %3
  %117 = add nsw i32 %116, %31
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %1, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !16, !amdgpu.noclobber !5
  %121 = fcmp contract olt double %120, %113
  %122 = sitofp i32 %115 to double
  %123 = select i1 %121, double %120, double %113
  %124 = select i1 %121, double %122, double %114
  %125 = add nuw nsw i32 %42, 8
  %126 = add i32 %45, 8
  %127 = icmp eq i32 %126, %40
  br i1 %127, label %128, label %41, !llvm.loop !20

128:                                              ; preds = %41, %34
  %129 = phi i32 [ 0, %34 ], [ %125, %41 ]
  %130 = phi double [ undef, %34 ], [ %124, %41 ]
  %131 = phi double [ %36, %34 ], [ %123, %41 ]
  %132 = icmp eq i32 %37, 0
  br i1 %132, label %150, label %133

133:                                              ; preds = %128, %133
  %134 = phi i32 [ %147, %133 ], [ %129, %128 ]
  %135 = phi double [ %146, %133 ], [ %130, %128 ]
  %136 = phi double [ %145, %133 ], [ %131, %128 ]
  %137 = phi i32 [ %148, %133 ], [ 0, %128 ]
  %138 = mul nsw i32 %134, %3
  %139 = add nsw i32 %138, %31
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %1, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !16, !amdgpu.noclobber !5
  %143 = fcmp contract olt double %142, %136
  %144 = sitofp i32 %134 to double
  %145 = select i1 %143, double %142, double %136
  %146 = select i1 %143, double %144, double %135
  %147 = add nuw nsw i32 %134, 1
  %148 = add i32 %137, 1
  %149 = icmp eq i32 %148, %37
  br i1 %149, label %150, label %133, !llvm.loop !22

150:                                              ; preds = %133, %128
  %151 = phi double [ %130, %128 ], [ %146, %133 ]
  %152 = fptosi double %151 to i32
  br label %153

153:                                              ; preds = %150, %28
  %154 = phi i32 [ undef, %28 ], [ %152, %150 ]
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %32
  store i32 %154, i32 addrspace(1)* %155, align 4, !tbaa !24
  br label %156

156:                                              ; preds = %153, %24
  ret void
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !18, i64 0}
