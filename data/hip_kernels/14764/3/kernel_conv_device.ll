; ModuleID = '../data/hip_kernels/14764/3/main.cu'
source_filename = "../data/hip_kernels/14764/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kernel_convP15HIP_vector_typeIdLj2EEPdS1_PiS3_iiiiii(%struct.HIP_vector_type addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = mul i32 %13, %18
  %23 = add i32 %22, %12
  %24 = udiv i32 %21, %18
  %25 = mul i32 %24, %18
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %18
  %30 = mul nsw i32 %10, %9
  %31 = icmp slt i32 %23, %30
  br i1 %31, label %32, label %189

32:                                               ; preds = %11
  %33 = add nsw i32 %5, -1
  %34 = add nsw i32 %6, -1
  br label %35

35:                                               ; preds = %32, %186
  %36 = phi i32 [ %23, %32 ], [ %187, %186 ]
  %37 = freeze i32 %36
  %38 = freeze i32 %10
  %39 = sdiv i32 %37, %38
  %40 = mul i32 %39, %38
  %41 = sub i32 %37, %40
  %42 = sext i32 %39 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !16
  %45 = sext i32 %41 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16
  %48 = sub nsw i32 %41, %34
  %49 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = tail call i32 @llvm.smin.i32(i32 %34, i32 %41)
  %51 = icmp sgt i32 %44, 0
  br i1 %51, label %52, label %186

52:                                               ; preds = %35
  %53 = tail call i32 @llvm.smin.i32(i32 %33, i32 %39)
  %54 = sub nsw i32 %39, %33
  %55 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = icmp sgt i32 %47, 0
  %57 = mul nsw i32 %39, %10
  %58 = add nsw i32 %57, %41
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %59, i32 0, i32 0, i32 0, i64 0
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %59, i32 0, i32 0, i32 0, i64 1
  %62 = and i32 %47, 3
  %63 = icmp ult i32 %47, 4
  %64 = and i32 %47, -4
  %65 = icmp eq i32 %62, 0
  br label %66

66:                                               ; preds = %181, %52
  %67 = phi i32 [ 0, %52 ], [ %184, %181 ]
  %68 = phi i32 [ %53, %52 ], [ %183, %181 ]
  %69 = phi i32 [ %55, %52 ], [ %182, %181 ]
  br i1 %56, label %70, label %181

70:                                               ; preds = %66
  %71 = mul nsw i32 %68, %6
  %72 = mul nsw i32 %69, %8
  %73 = load double, double addrspace(1)* %60, align 16, !tbaa !20
  %74 = load double, double addrspace(1)* %61, align 8, !tbaa !20
  br i1 %63, label %151, label %75

75:                                               ; preds = %70, %75
  %76 = phi double [ %146, %75 ], [ %74, %70 ]
  %77 = phi double [ %141, %75 ], [ %73, %70 ]
  %78 = phi i32 [ %148, %75 ], [ %50, %70 ]
  %79 = phi i32 [ %147, %75 ], [ %49, %70 ]
  %80 = phi i32 [ %149, %75 ], [ 0, %70 ]
  %81 = add nsw i32 %78, %71
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !21
  %85 = add nsw i32 %79, %72
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %86, i32 0, i32 0, i32 0, i64 0
  %88 = load double, double addrspace(1)* %87, align 16, !tbaa !20
  %89 = fmul contract double %84, %88
  %90 = fadd contract double %77, %89
  store double %90, double addrspace(1)* %60, align 16, !tbaa !20
  %91 = load double, double addrspace(1)* %83, align 8, !tbaa !21
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %86, i32 0, i32 0, i32 0, i64 1
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !20
  %94 = fmul contract double %91, %93
  %95 = fadd contract double %76, %94
  store double %95, double addrspace(1)* %61, align 8, !tbaa !20
  %96 = add nuw nsw i32 %79, 1
  %97 = add nsw i32 %78, -1
  %98 = add nsw i32 %97, %71
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !21
  %102 = add nsw i32 %96, %72
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %103, i32 0, i32 0, i32 0, i64 0
  %105 = load double, double addrspace(1)* %104, align 16, !tbaa !20
  %106 = fmul contract double %101, %105
  %107 = fadd contract double %90, %106
  store double %107, double addrspace(1)* %60, align 16, !tbaa !20
  %108 = load double, double addrspace(1)* %100, align 8, !tbaa !21
  %109 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %103, i32 0, i32 0, i32 0, i64 1
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !20
  %111 = fmul contract double %108, %110
  %112 = fadd contract double %95, %111
  store double %112, double addrspace(1)* %61, align 8, !tbaa !20
  %113 = add nuw nsw i32 %79, 2
  %114 = add nsw i32 %78, -2
  %115 = add nsw i32 %114, %71
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %1, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !21
  %119 = add nsw i32 %113, %72
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %120, i32 0, i32 0, i32 0, i64 0
  %122 = load double, double addrspace(1)* %121, align 16, !tbaa !20
  %123 = fmul contract double %118, %122
  %124 = fadd contract double %107, %123
  store double %124, double addrspace(1)* %60, align 16, !tbaa !20
  %125 = load double, double addrspace(1)* %117, align 8, !tbaa !21
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %120, i32 0, i32 0, i32 0, i64 1
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !20
  %128 = fmul contract double %125, %127
  %129 = fadd contract double %112, %128
  store double %129, double addrspace(1)* %61, align 8, !tbaa !20
  %130 = add nuw nsw i32 %79, 3
  %131 = add nsw i32 %78, -3
  %132 = add nsw i32 %131, %71
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %1, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !21
  %136 = add nsw i32 %130, %72
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %137, i32 0, i32 0, i32 0, i64 0
  %139 = load double, double addrspace(1)* %138, align 16, !tbaa !20
  %140 = fmul contract double %135, %139
  %141 = fadd contract double %124, %140
  store double %141, double addrspace(1)* %60, align 16, !tbaa !20
  %142 = load double, double addrspace(1)* %134, align 8, !tbaa !21
  %143 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %137, i32 0, i32 0, i32 0, i64 1
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !20
  %145 = fmul contract double %142, %144
  %146 = fadd contract double %129, %145
  store double %146, double addrspace(1)* %61, align 8, !tbaa !20
  %147 = add nuw nsw i32 %79, 4
  %148 = add nsw i32 %78, -4
  %149 = add i32 %80, 4
  %150 = icmp eq i32 %149, %64
  br i1 %150, label %151, label %75, !llvm.loop !23

151:                                              ; preds = %75, %70
  %152 = phi double [ %74, %70 ], [ %146, %75 ]
  %153 = phi double [ %73, %70 ], [ %141, %75 ]
  %154 = phi i32 [ %50, %70 ], [ %148, %75 ]
  %155 = phi i32 [ %49, %70 ], [ %147, %75 ]
  br i1 %65, label %181, label %156

156:                                              ; preds = %151, %156
  %157 = phi double [ %176, %156 ], [ %152, %151 ]
  %158 = phi double [ %171, %156 ], [ %153, %151 ]
  %159 = phi i32 [ %178, %156 ], [ %154, %151 ]
  %160 = phi i32 [ %177, %156 ], [ %155, %151 ]
  %161 = phi i32 [ %179, %156 ], [ 0, %151 ]
  %162 = add nsw i32 %159, %71
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds double, double addrspace(1)* %1, i64 %163
  %165 = load double, double addrspace(1)* %164, align 8, !tbaa !21
  %166 = add nsw i32 %160, %72
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %167, i32 0, i32 0, i32 0, i64 0
  %169 = load double, double addrspace(1)* %168, align 16, !tbaa !20
  %170 = fmul contract double %165, %169
  %171 = fadd contract double %158, %170
  store double %171, double addrspace(1)* %60, align 16, !tbaa !20
  %172 = load double, double addrspace(1)* %164, align 8, !tbaa !21
  %173 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %167, i32 0, i32 0, i32 0, i64 1
  %174 = load double, double addrspace(1)* %173, align 8, !tbaa !20
  %175 = fmul contract double %172, %174
  %176 = fadd contract double %157, %175
  store double %176, double addrspace(1)* %61, align 8, !tbaa !20
  %177 = add nuw nsw i32 %160, 1
  %178 = add nsw i32 %159, -1
  %179 = add i32 %161, 1
  %180 = icmp eq i32 %179, %62
  br i1 %180, label %181, label %156, !llvm.loop !25

181:                                              ; preds = %151, %156, %66
  %182 = add nuw nsw i32 %69, 1
  %183 = add nsw i32 %68, -1
  %184 = add nuw nsw i32 %67, 1
  %185 = icmp eq i32 %184, %44
  br i1 %185, label %186, label %66, !llvm.loop !27

186:                                              ; preds = %181, %35
  %187 = add nsw i32 %36, %29
  %188 = icmp slt i32 %187, %30
  br i1 %188, label %35, label %189, !llvm.loop !28

189:                                              ; preds = %186, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"double", !18, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.unroll.disable"}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !24}
