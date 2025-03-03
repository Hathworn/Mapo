; ModuleID = '../data/hip_kernels/2665/1/main.cu'
source_filename = "../data/hip_kernels/2665/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11test_kerneliPdS_S_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %26, %27
  %30 = mul i32 %29, %13
  %31 = add i32 %30, %28
  %32 = icmp slt i32 %31, 2048
  br i1 %32, label %33, label %181

33:                                               ; preds = %4, %171
  %34 = phi i32 [ %179, %171 ], [ 0, %4 ]
  %35 = mul nsw i32 %34, %0
  %36 = add nsw i32 %35, %31
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %2, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !16
  %40 = icmp eq i32 %34, 0
  br i1 %40, label %171, label %41

41:                                               ; preds = %33
  %42 = and i32 %34, 7
  %43 = icmp ult i32 %34, 8
  br i1 %43, label %148, label %44

44:                                               ; preds = %41
  %45 = and i32 %34, 2147483640
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi double [ %39, %44 ], [ %144, %46 ]
  %48 = phi i32 [ 0, %44 ], [ %145, %46 ]
  %49 = phi i32 [ 0, %44 ], [ %146, %46 ]
  %50 = mul nsw i32 %48, %0
  %51 = add nsw i32 %50, %34
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16
  %55 = add nsw i32 %50, %31
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %3, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !16
  %59 = fmul contract double %54, %58
  %60 = fsub contract double %47, %59
  %61 = or i32 %48, 1
  %62 = mul nsw i32 %61, %0
  %63 = add nsw i32 %62, %34
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %1, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !16
  %67 = add nsw i32 %62, %31
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %3, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !16
  %71 = fmul contract double %66, %70
  %72 = fsub contract double %60, %71
  %73 = or i32 %48, 2
  %74 = mul nsw i32 %73, %0
  %75 = add nsw i32 %74, %34
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !16
  %79 = add nsw i32 %74, %31
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !16
  %83 = fmul contract double %78, %82
  %84 = fsub contract double %72, %83
  %85 = or i32 %48, 3
  %86 = mul nsw i32 %85, %0
  %87 = add nsw i32 %86, %34
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %91 = add nsw i32 %86, %31
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !16
  %95 = fmul contract double %90, %94
  %96 = fsub contract double %84, %95
  %97 = or i32 %48, 4
  %98 = mul nsw i32 %97, %0
  %99 = add nsw i32 %98, %34
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !16
  %103 = add nsw i32 %98, %31
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %3, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !16
  %107 = fmul contract double %102, %106
  %108 = fsub contract double %96, %107
  %109 = or i32 %48, 5
  %110 = mul nsw i32 %109, %0
  %111 = add nsw i32 %110, %34
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %1, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !16
  %115 = add nsw i32 %110, %31
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %3, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !16
  %119 = fmul contract double %114, %118
  %120 = fsub contract double %108, %119
  %121 = or i32 %48, 6
  %122 = mul nsw i32 %121, %0
  %123 = add nsw i32 %122, %34
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, double addrspace(1)* %1, i64 %124
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !16
  %127 = add nsw i32 %122, %31
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %3, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !16
  %131 = fmul contract double %126, %130
  %132 = fsub contract double %120, %131
  %133 = or i32 %48, 7
  %134 = mul nsw i32 %133, %0
  %135 = add nsw i32 %134, %34
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %1, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !16
  %139 = add nsw i32 %134, %31
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds double, double addrspace(1)* %3, i64 %140
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !16
  %143 = fmul contract double %138, %142
  %144 = fsub contract double %132, %143
  %145 = add nuw nsw i32 %48, 8
  %146 = add i32 %49, 8
  %147 = icmp eq i32 %146, %45
  br i1 %147, label %148, label %46, !llvm.loop !20

148:                                              ; preds = %46, %41
  %149 = phi double [ undef, %41 ], [ %144, %46 ]
  %150 = phi double [ %39, %41 ], [ %144, %46 ]
  %151 = phi i32 [ 0, %41 ], [ %145, %46 ]
  %152 = icmp eq i32 %42, 0
  br i1 %152, label %171, label %153

153:                                              ; preds = %148, %153
  %154 = phi double [ %167, %153 ], [ %150, %148 ]
  %155 = phi i32 [ %168, %153 ], [ %151, %148 ]
  %156 = phi i32 [ %169, %153 ], [ 0, %148 ]
  %157 = mul nsw i32 %155, %0
  %158 = add nsw i32 %157, %34
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds double, double addrspace(1)* %1, i64 %159
  %161 = load double, double addrspace(1)* %160, align 8, !tbaa !16
  %162 = add nsw i32 %157, %31
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds double, double addrspace(1)* %3, i64 %163
  %165 = load double, double addrspace(1)* %164, align 8, !tbaa !16
  %166 = fmul contract double %161, %165
  %167 = fsub contract double %154, %166
  %168 = add nuw nsw i32 %155, 1
  %169 = add i32 %156, 1
  %170 = icmp eq i32 %169, %42
  br i1 %170, label %171, label %153, !llvm.loop !22

171:                                              ; preds = %148, %153, %33
  %172 = phi double [ %39, %33 ], [ %149, %148 ], [ %167, %153 ]
  %173 = add nsw i32 %35, %34
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds double, double addrspace(1)* %1, i64 %174
  %176 = load double, double addrspace(1)* %175, align 8, !tbaa !16
  %177 = fdiv contract double %172, %176
  %178 = getelementptr inbounds double, double addrspace(1)* %3, i64 %37
  store double %177, double addrspace(1)* %178, align 8, !tbaa !16
  %179 = add nuw nsw i32 %34, 1
  %180 = icmp eq i32 %179, 2048
  br i1 %180, label %181, label %33, !llvm.loop !24

181:                                              ; preds = %171, %4
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
