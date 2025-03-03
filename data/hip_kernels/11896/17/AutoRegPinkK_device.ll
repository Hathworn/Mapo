; ModuleID = '../data/hip_kernels/11896/17/main.cu'
source_filename = "../data/hip_kernels/11896/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12AutoRegPinkKPdS_S_S_S_S_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %6
  br i1 %18, label %19, label %217

19:                                               ; preds = %8
  %20 = icmp sgt i32 %7, 0
  br i1 %20, label %21, label %151

21:                                               ; preds = %19
  %22 = sext i32 %17 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %0, i64 %22
  %24 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %25 = and i32 %7, 3
  %26 = icmp ult i32 %7, 4
  br i1 %26, label %29, label %27

27:                                               ; preds = %21
  %28 = and i32 %7, -4
  br label %60

29:                                               ; preds = %60, %21
  %30 = phi i32 [ 0, %21 ], [ %130, %60 ]
  %31 = icmp eq i32 %25, 0
  br i1 %31, label %54, label %32

32:                                               ; preds = %29, %32
  %33 = phi i32 [ %51, %32 ], [ %30, %29 ]
  %34 = phi i32 [ %52, %32 ], [ 0, %29 ]
  %35 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %36 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %37 = fadd contract double %35, %36
  %38 = zext i32 %33 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %4, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = fmul contract double %37, %40
  %42 = getelementptr inbounds double, double addrspace(1)* %3, i64 %38
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = mul nsw i32 %33, %6
  %45 = add nsw i32 %44, %17
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %5, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fmul contract double %43, %48
  %50 = fsub contract double %41, %49
  store double %50, double addrspace(1)* %47, align 8, !tbaa !7
  %51 = add nuw nsw i32 %33, 1
  %52 = add i32 %34, 1
  %53 = icmp eq i32 %52, %25
  br i1 %53, label %54, label %32, !llvm.loop !11

54:                                               ; preds = %32, %29
  br i1 %20, label %55, label %151

55:                                               ; preds = %54
  %56 = and i32 %7, 7
  %57 = icmp ult i32 %7, 8
  br i1 %57, label %133, label %58

58:                                               ; preds = %55
  %59 = and i32 %7, -8
  br label %155

60:                                               ; preds = %60, %27
  %61 = phi i32 [ 0, %27 ], [ %130, %60 ]
  %62 = phi i32 [ 0, %27 ], [ %131, %60 ]
  %63 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %64 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %65 = fadd contract double %63, %64
  %66 = zext i32 %61 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %4, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = fmul contract double %65, %68
  %70 = getelementptr inbounds double, double addrspace(1)* %3, i64 %66
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = mul nsw i32 %61, %6
  %73 = add nsw i32 %72, %17
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %5, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = fmul contract double %71, %76
  %78 = fsub contract double %69, %77
  store double %78, double addrspace(1)* %75, align 8, !tbaa !7
  %79 = or i32 %61, 1
  %80 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %81 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %82 = fadd contract double %80, %81
  %83 = zext i32 %79 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %4, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = fmul contract double %82, %85
  %87 = getelementptr inbounds double, double addrspace(1)* %3, i64 %83
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  %89 = mul nsw i32 %79, %6
  %90 = add nsw i32 %89, %17
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %5, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7
  %94 = fmul contract double %88, %93
  %95 = fsub contract double %86, %94
  store double %95, double addrspace(1)* %92, align 8, !tbaa !7
  %96 = or i32 %61, 2
  %97 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %98 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %99 = fadd contract double %97, %98
  %100 = zext i32 %96 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %4, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = fmul contract double %99, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %3, i64 %100
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = mul nsw i32 %96, %6
  %107 = add nsw i32 %106, %17
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %5, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !7
  %111 = fmul contract double %105, %110
  %112 = fsub contract double %103, %111
  store double %112, double addrspace(1)* %109, align 8, !tbaa !7
  %113 = or i32 %61, 3
  %114 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %115 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %116 = fadd contract double %114, %115
  %117 = zext i32 %113 to i64
  %118 = getelementptr inbounds double, double addrspace(1)* %4, i64 %117
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7
  %120 = fmul contract double %116, %119
  %121 = getelementptr inbounds double, double addrspace(1)* %3, i64 %117
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = mul nsw i32 %113, %6
  %124 = add nsw i32 %123, %17
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds double, double addrspace(1)* %5, i64 %125
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !7
  %128 = fmul contract double %122, %127
  %129 = fsub contract double %120, %128
  store double %129, double addrspace(1)* %126, align 8, !tbaa !7
  %130 = add nuw nsw i32 %61, 4
  %131 = add i32 %62, 4
  %132 = icmp eq i32 %131, %28
  br i1 %132, label %29, label %60, !llvm.loop !13

133:                                              ; preds = %155, %55
  %134 = phi double [ undef, %55 ], [ %213, %155 ]
  %135 = phi i32 [ 0, %55 ], [ %214, %155 ]
  %136 = phi double [ 0.000000e+00, %55 ], [ %213, %155 ]
  %137 = icmp eq i32 %56, 0
  br i1 %137, label %151, label %138

138:                                              ; preds = %133, %138
  %139 = phi i32 [ %148, %138 ], [ %135, %133 ]
  %140 = phi double [ %147, %138 ], [ %136, %133 ]
  %141 = phi i32 [ %149, %138 ], [ 0, %133 ]
  %142 = mul nsw i32 %139, %6
  %143 = add nsw i32 %142, %17
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, double addrspace(1)* %5, i64 %144
  %146 = load double, double addrspace(1)* %145, align 8, !tbaa !7
  %147 = fadd contract double %140, %146
  %148 = add nuw nsw i32 %139, 1
  %149 = add i32 %141, 1
  %150 = icmp eq i32 %149, %56
  br i1 %150, label %151, label %138, !llvm.loop !15

151:                                              ; preds = %133, %138, %19, %54
  %152 = phi double [ 0.000000e+00, %54 ], [ 0.000000e+00, %19 ], [ %134, %133 ], [ %147, %138 ]
  %153 = sext i32 %17 to i64
  %154 = getelementptr inbounds double, double addrspace(1)* %2, i64 %153
  store double %152, double addrspace(1)* %154, align 8, !tbaa !7
  br label %217

155:                                              ; preds = %155, %58
  %156 = phi i32 [ 0, %58 ], [ %214, %155 ]
  %157 = phi double [ 0.000000e+00, %58 ], [ %213, %155 ]
  %158 = phi i32 [ 0, %58 ], [ %215, %155 ]
  %159 = mul nsw i32 %156, %6
  %160 = add nsw i32 %159, %17
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %5, i64 %161
  %163 = load double, double addrspace(1)* %162, align 8, !tbaa !7
  %164 = fadd contract double %157, %163
  %165 = or i32 %156, 1
  %166 = mul nsw i32 %165, %6
  %167 = add nsw i32 %166, %17
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds double, double addrspace(1)* %5, i64 %168
  %170 = load double, double addrspace(1)* %169, align 8, !tbaa !7
  %171 = fadd contract double %164, %170
  %172 = or i32 %156, 2
  %173 = mul nsw i32 %172, %6
  %174 = add nsw i32 %173, %17
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds double, double addrspace(1)* %5, i64 %175
  %177 = load double, double addrspace(1)* %176, align 8, !tbaa !7
  %178 = fadd contract double %171, %177
  %179 = or i32 %156, 3
  %180 = mul nsw i32 %179, %6
  %181 = add nsw i32 %180, %17
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds double, double addrspace(1)* %5, i64 %182
  %184 = load double, double addrspace(1)* %183, align 8, !tbaa !7
  %185 = fadd contract double %178, %184
  %186 = or i32 %156, 4
  %187 = mul nsw i32 %186, %6
  %188 = add nsw i32 %187, %17
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds double, double addrspace(1)* %5, i64 %189
  %191 = load double, double addrspace(1)* %190, align 8, !tbaa !7
  %192 = fadd contract double %185, %191
  %193 = or i32 %156, 5
  %194 = mul nsw i32 %193, %6
  %195 = add nsw i32 %194, %17
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds double, double addrspace(1)* %5, i64 %196
  %198 = load double, double addrspace(1)* %197, align 8, !tbaa !7
  %199 = fadd contract double %192, %198
  %200 = or i32 %156, 6
  %201 = mul nsw i32 %200, %6
  %202 = add nsw i32 %201, %17
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds double, double addrspace(1)* %5, i64 %203
  %205 = load double, double addrspace(1)* %204, align 8, !tbaa !7
  %206 = fadd contract double %199, %205
  %207 = or i32 %156, 7
  %208 = mul nsw i32 %207, %6
  %209 = add nsw i32 %208, %17
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds double, double addrspace(1)* %5, i64 %210
  %212 = load double, double addrspace(1)* %211, align 8, !tbaa !7
  %213 = fadd contract double %206, %212
  %214 = add nuw nsw i32 %156, 8
  %215 = add i32 %158, 8
  %216 = icmp eq i32 %215, %59
  br i1 %216, label %133, label %155, !llvm.loop !16

217:                                              ; preds = %151, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
