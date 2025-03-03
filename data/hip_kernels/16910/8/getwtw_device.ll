; ModuleID = '../data/hip_kernels/16910/8/main.cu'
source_filename = "../data/hip_kernels/16910/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6getwtwPKdS0_Pd(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %5 = load double, double addrspace(1)* %4, align 8, !tbaa !4, !amdgpu.noclobber !8
  %6 = fptosi double %5 to i32
  %7 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !9
  %12 = icmp slt i32 %11, %6
  br i1 %12, label %13, label %172

13:                                               ; preds = %3
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp sgt i32 %9, 0
  %16 = mul i32 %14, %6
  %17 = mul i32 %16, %9
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !10, !invariant.load !8
  %22 = zext i16 %21 to i32
  %23 = and i32 %9, 7
  %24 = icmp ult i32 %9, 8
  %25 = and i32 %9, -8
  %26 = icmp eq i32 %23, 0
  br label %27

27:                                               ; preds = %13, %163
  %28 = phi i32 [ %11, %13 ], [ %170, %163 ]
  br i1 %15, label %29, label %163

29:                                               ; preds = %27
  br i1 %24, label %140, label %30

30:                                               ; preds = %29, %30
  %31 = phi double [ %136, %30 ], [ 0.000000e+00, %29 ]
  %32 = phi i32 [ %137, %30 ], [ 0, %29 ]
  %33 = phi i32 [ %138, %30 ], [ 0, %29 ]
  %34 = mul nsw i32 %32, %6
  %35 = add i32 %34, %17
  %36 = add i32 %35, %10
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !4
  %40 = add i32 %35, %28
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !4
  %44 = fmul contract double %39, %43
  %45 = fadd contract double %31, %44
  %46 = or i32 %32, 1
  %47 = mul nsw i32 %46, %6
  %48 = add i32 %47, %17
  %49 = add i32 %48, %10
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !4
  %53 = add i32 %48, %28
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %1, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !4
  %57 = fmul contract double %52, %56
  %58 = fadd contract double %45, %57
  %59 = or i32 %32, 2
  %60 = mul nsw i32 %59, %6
  %61 = add i32 %60, %17
  %62 = add i32 %61, %10
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !4
  %66 = add i32 %61, %28
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !4
  %70 = fmul contract double %65, %69
  %71 = fadd contract double %58, %70
  %72 = or i32 %32, 3
  %73 = mul nsw i32 %72, %6
  %74 = add i32 %73, %17
  %75 = add i32 %74, %10
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !4
  %79 = add i32 %74, %28
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %1, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !4
  %83 = fmul contract double %78, %82
  %84 = fadd contract double %71, %83
  %85 = or i32 %32, 4
  %86 = mul nsw i32 %85, %6
  %87 = add i32 %86, %17
  %88 = add i32 %87, %10
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double addrspace(1)* %1, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !4
  %92 = add i32 %87, %28
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !4
  %96 = fmul contract double %91, %95
  %97 = fadd contract double %84, %96
  %98 = or i32 %32, 5
  %99 = mul nsw i32 %98, %6
  %100 = add i32 %99, %17
  %101 = add i32 %100, %10
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %1, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !4
  %105 = add i32 %100, %28
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %1, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !4
  %109 = fmul contract double %104, %108
  %110 = fadd contract double %97, %109
  %111 = or i32 %32, 6
  %112 = mul nsw i32 %111, %6
  %113 = add i32 %112, %17
  %114 = add i32 %113, %10
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %1, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !4
  %118 = add i32 %113, %28
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds double, double addrspace(1)* %1, i64 %119
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !4
  %122 = fmul contract double %117, %121
  %123 = fadd contract double %110, %122
  %124 = or i32 %32, 7
  %125 = mul nsw i32 %124, %6
  %126 = add i32 %125, %17
  %127 = add i32 %126, %10
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds double, double addrspace(1)* %1, i64 %128
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !4
  %131 = add i32 %126, %28
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds double, double addrspace(1)* %1, i64 %132
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !4
  %135 = fmul contract double %130, %134
  %136 = fadd contract double %123, %135
  %137 = add nuw nsw i32 %32, 8
  %138 = add i32 %33, 8
  %139 = icmp eq i32 %138, %25
  br i1 %139, label %140, label %30, !llvm.loop !11

140:                                              ; preds = %30, %29
  %141 = phi double [ undef, %29 ], [ %136, %30 ]
  %142 = phi double [ 0.000000e+00, %29 ], [ %136, %30 ]
  %143 = phi i32 [ 0, %29 ], [ %137, %30 ]
  br i1 %26, label %163, label %144

144:                                              ; preds = %140, %144
  %145 = phi double [ %159, %144 ], [ %142, %140 ]
  %146 = phi i32 [ %160, %144 ], [ %143, %140 ]
  %147 = phi i32 [ %161, %144 ], [ 0, %140 ]
  %148 = mul nsw i32 %146, %6
  %149 = add i32 %148, %17
  %150 = add i32 %149, %10
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %1, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !4
  %154 = add i32 %149, %28
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double addrspace(1)* %1, i64 %155
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !4
  %158 = fmul contract double %153, %157
  %159 = fadd contract double %145, %158
  %160 = add nuw nsw i32 %146, 1
  %161 = add i32 %147, 1
  %162 = icmp eq i32 %161, %23
  br i1 %162, label %163, label %144, !llvm.loop !13

163:                                              ; preds = %140, %144, %27
  %164 = phi double [ 0.000000e+00, %27 ], [ %141, %140 ], [ %159, %144 ]
  %165 = add i32 %28, %16
  %166 = mul i32 %165, %6
  %167 = add i32 %166, %10
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds double, double addrspace(1)* %2, i64 %168
  store double %164, double addrspace(1)* %169, align 8, !tbaa !4
  %170 = add i32 %28, %22
  %171 = icmp slt i32 %170, %6
  br i1 %171, label %27, label %172, !llvm.loop !15

172:                                              ; preds = %163, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
