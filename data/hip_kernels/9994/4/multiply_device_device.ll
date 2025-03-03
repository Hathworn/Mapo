; ModuleID = '../data/hip_kernels/9994/4/main.cu'
source_filename = "../data/hip_kernels/9994/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15multiply_devicePdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp slt i32 %5, %2
  br i1 %6, label %7, label %161

7:                                                ; preds = %3
  %8 = icmp sgt i32 %2, 0
  %9 = mul nsw i32 %4, %2
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !5
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !14, !invariant.load !15
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = and i32 %2, 7
  %23 = icmp ult i32 %2, 8
  %24 = and i32 %2, -8
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %7, %153
  %27 = phi i32 [ %5, %7 ], [ %159, %153 ]
  br i1 %8, label %28, label %153

28:                                               ; preds = %26
  br i1 %23, label %131, label %29

29:                                               ; preds = %28, %29
  %30 = phi i32 [ %128, %29 ], [ 0, %28 ]
  %31 = phi double [ %127, %29 ], [ 0.000000e+00, %28 ]
  %32 = phi i32 [ %129, %29 ], [ 0, %28 ]
  %33 = mul nsw i32 %30, %2
  %34 = add nsw i32 %33, %4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !16
  %38 = add nsw i32 %33, %27
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = fmul contract double %37, %41
  %43 = fadd contract double %31, %42
  %44 = or i32 %30, 1
  %45 = mul nsw i32 %44, %2
  %46 = add nsw i32 %45, %4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !16
  %50 = add nsw i32 %45, %27
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = fmul contract double %49, %53
  %55 = fadd contract double %43, %54
  %56 = or i32 %30, 2
  %57 = mul nsw i32 %56, %2
  %58 = add nsw i32 %57, %4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %0, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !16
  %62 = add nsw i32 %57, %27
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !16
  %66 = fmul contract double %61, %65
  %67 = fadd contract double %55, %66
  %68 = or i32 %30, 3
  %69 = mul nsw i32 %68, %2
  %70 = add nsw i32 %69, %4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %0, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16
  %74 = add nsw i32 %69, %27
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !16
  %78 = fmul contract double %73, %77
  %79 = fadd contract double %67, %78
  %80 = or i32 %30, 4
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !16
  %86 = add nsw i32 %81, %27
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !16
  %90 = fmul contract double %85, %89
  %91 = fadd contract double %79, %90
  %92 = or i32 %30, 5
  %93 = mul nsw i32 %92, %2
  %94 = add nsw i32 %93, %4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %0, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !16
  %98 = add nsw i32 %93, %27
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !16
  %102 = fmul contract double %97, %101
  %103 = fadd contract double %91, %102
  %104 = or i32 %30, 6
  %105 = mul nsw i32 %104, %2
  %106 = add nsw i32 %105, %4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %0, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !16
  %110 = add nsw i32 %105, %27
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %0, i64 %111
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !16
  %114 = fmul contract double %109, %113
  %115 = fadd contract double %103, %114
  %116 = or i32 %30, 7
  %117 = mul nsw i32 %116, %2
  %118 = add nsw i32 %117, %4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %0, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !16
  %122 = add nsw i32 %117, %27
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %0, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !16
  %126 = fmul contract double %121, %125
  %127 = fadd contract double %115, %126
  %128 = add nuw nsw i32 %30, 8
  %129 = add i32 %32, 8
  %130 = icmp eq i32 %129, %24
  br i1 %130, label %131, label %29, !llvm.loop !20

131:                                              ; preds = %29, %28
  %132 = phi double [ undef, %28 ], [ %127, %29 ]
  %133 = phi i32 [ 0, %28 ], [ %128, %29 ]
  %134 = phi double [ 0.000000e+00, %28 ], [ %127, %29 ]
  br i1 %25, label %153, label %135

135:                                              ; preds = %131, %135
  %136 = phi i32 [ %150, %135 ], [ %133, %131 ]
  %137 = phi double [ %149, %135 ], [ %134, %131 ]
  %138 = phi i32 [ %151, %135 ], [ 0, %131 ]
  %139 = mul nsw i32 %136, %2
  %140 = add nsw i32 %139, %4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds double, double addrspace(1)* %0, i64 %141
  %143 = load double, double addrspace(1)* %142, align 8, !tbaa !16
  %144 = add nsw i32 %139, %27
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %0, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !16
  %148 = fmul contract double %143, %147
  %149 = fadd contract double %137, %148
  %150 = add nuw nsw i32 %136, 1
  %151 = add i32 %138, 1
  %152 = icmp eq i32 %151, %22
  br i1 %152, label %153, label %135, !llvm.loop !22

153:                                              ; preds = %131, %135, %26
  %154 = phi double [ 0.000000e+00, %26 ], [ %132, %131 ], [ %149, %135 ]
  %155 = add nsw i32 %27, %9
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds double, double addrspace(1)* %1, i64 %156
  store double %154, double addrspace(1)* %157, align 8, !tbaa !16
  %158 = add i32 %18, %27
  %159 = add i32 %158, %21
  %160 = icmp slt i32 %159, %2
  br i1 %160, label %26, label %161, !llvm.loop !24

161:                                              ; preds = %153, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
