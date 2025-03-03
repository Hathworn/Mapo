; ModuleID = '../data/hip_kernels/3587/1/main.cu'
source_filename = "../data/hip_kernels/3587/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL12calc_predictiiPddPiS_S0_ = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL12calc_predictiiPddPiS_S0_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 comdat {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %183

18:                                               ; preds = %7
  %19 = icmp sgt i32 %1, 0
  br i1 %19, label %20, label %51

20:                                               ; preds = %18
  %21 = and i32 %1, 7
  %22 = icmp ult i32 %1, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = and i32 %1, -8
  br label %57

25:                                               ; preds = %57, %20
  %26 = phi double [ undef, %20 ], [ %179, %57 ]
  %27 = phi i32 [ 0, %20 ], [ %180, %57 ]
  %28 = phi double [ %3, %20 ], [ %179, %57 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %51, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %48, %30 ], [ %27, %25 ]
  %32 = phi double [ %47, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %49, %30 ], [ 0, %25 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %34
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !5
  %39 = sitofp i32 %38 to double
  %40 = fmul contract double %36, %39
  %41 = mul nsw i32 %31, %0
  %42 = add nsw i32 %41, %16
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %5, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !5
  %46 = fmul contract double %45, %40
  %47 = fadd contract double %32, %46
  %48 = add nuw nsw i32 %31, 1
  %49 = add i32 %33, 1
  %50 = icmp eq i32 %49, %21
  br i1 %50, label %51, label %30, !llvm.loop !13

51:                                               ; preds = %25, %30, %18
  %52 = phi double [ %3, %18 ], [ %26, %25 ], [ %47, %30 ]
  %53 = fcmp contract oge double %52, 0.000000e+00
  %54 = select i1 %53, i32 1, i32 -1
  %55 = sext i32 %16 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %55
  store i32 %54, i32 addrspace(1)* %56, align 4, !tbaa !11
  br label %183

57:                                               ; preds = %57, %23
  %58 = phi i32 [ 0, %23 ], [ %180, %57 ]
  %59 = phi double [ %3, %23 ], [ %179, %57 ]
  %60 = phi i32 [ 0, %23 ], [ %181, %57 ]
  %61 = zext i32 %58 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !5
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !11, !amdgpu.noclobber !5
  %66 = sitofp i32 %65 to double
  %67 = fmul contract double %63, %66
  %68 = mul nsw i32 %58, %0
  %69 = add nsw i32 %68, %16
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %5, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !5
  %73 = fmul contract double %72, %67
  %74 = fadd contract double %59, %73
  %75 = or i32 %58, 1
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %2, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7, !amdgpu.noclobber !5
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !11, !amdgpu.noclobber !5
  %81 = sitofp i32 %80 to double
  %82 = fmul contract double %78, %81
  %83 = mul nsw i32 %75, %0
  %84 = add nsw i32 %83, %16
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %5, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7, !amdgpu.noclobber !5
  %88 = fmul contract double %87, %82
  %89 = fadd contract double %74, %88
  %90 = or i32 %58, 2
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %2, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %91
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !11, !amdgpu.noclobber !5
  %96 = sitofp i32 %95 to double
  %97 = fmul contract double %93, %96
  %98 = mul nsw i32 %90, %0
  %99 = add nsw i32 %98, %16
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %5, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7, !amdgpu.noclobber !5
  %103 = fmul contract double %102, %97
  %104 = fadd contract double %89, %103
  %105 = or i32 %58, 3
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %2, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7, !amdgpu.noclobber !5
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %106
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !11, !amdgpu.noclobber !5
  %111 = sitofp i32 %110 to double
  %112 = fmul contract double %108, %111
  %113 = mul nsw i32 %105, %0
  %114 = add nsw i32 %113, %16
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %5, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract double %117, %112
  %119 = fadd contract double %104, %118
  %120 = or i32 %58, 4
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds double, double addrspace(1)* %2, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7, !amdgpu.noclobber !5
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %121
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !11, !amdgpu.noclobber !5
  %126 = sitofp i32 %125 to double
  %127 = fmul contract double %123, %126
  %128 = mul nsw i32 %120, %0
  %129 = add nsw i32 %128, %16
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %5, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !7, !amdgpu.noclobber !5
  %133 = fmul contract double %132, %127
  %134 = fadd contract double %119, %133
  %135 = or i32 %58, 5
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds double, double addrspace(1)* %2, i64 %136
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !7, !amdgpu.noclobber !5
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %136
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !11, !amdgpu.noclobber !5
  %141 = sitofp i32 %140 to double
  %142 = fmul contract double %138, %141
  %143 = mul nsw i32 %135, %0
  %144 = add nsw i32 %143, %16
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds double, double addrspace(1)* %5, i64 %145
  %147 = load double, double addrspace(1)* %146, align 8, !tbaa !7, !amdgpu.noclobber !5
  %148 = fmul contract double %147, %142
  %149 = fadd contract double %134, %148
  %150 = or i32 %58, 6
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds double, double addrspace(1)* %2, i64 %151
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7, !amdgpu.noclobber !5
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %151
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !11, !amdgpu.noclobber !5
  %156 = sitofp i32 %155 to double
  %157 = fmul contract double %153, %156
  %158 = mul nsw i32 %150, %0
  %159 = add nsw i32 %158, %16
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds double, double addrspace(1)* %5, i64 %160
  %162 = load double, double addrspace(1)* %161, align 8, !tbaa !7, !amdgpu.noclobber !5
  %163 = fmul contract double %162, %157
  %164 = fadd contract double %149, %163
  %165 = or i32 %58, 7
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds double, double addrspace(1)* %2, i64 %166
  %168 = load double, double addrspace(1)* %167, align 8, !tbaa !7, !amdgpu.noclobber !5
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %166
  %170 = load i32, i32 addrspace(1)* %169, align 4, !tbaa !11, !amdgpu.noclobber !5
  %171 = sitofp i32 %170 to double
  %172 = fmul contract double %168, %171
  %173 = mul nsw i32 %165, %0
  %174 = add nsw i32 %173, %16
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds double, double addrspace(1)* %5, i64 %175
  %177 = load double, double addrspace(1)* %176, align 8, !tbaa !7, !amdgpu.noclobber !5
  %178 = fmul contract double %177, %172
  %179 = fadd contract double %164, %178
  %180 = add nuw nsw i32 %58, 8
  %181 = add i32 %60, 8
  %182 = icmp eq i32 %181, %24
  br i1 %182, label %25, label %57, !llvm.loop !15

183:                                              ; preds = %51, %7
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
