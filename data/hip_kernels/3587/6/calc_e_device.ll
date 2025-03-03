; ModuleID = '../data/hip_kernels/3587/6/main.cu'
source_filename = "../data/hip_kernels/3587/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL6calc_eiPddPiS_S_ = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL6calc_eiPddPiS_S_(i32 %0, double addrspace(1)* nocapture readonly %1, double %2, i32 addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 comdat {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %184

17:                                               ; preds = %6
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %19, label %50

19:                                               ; preds = %17
  %20 = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %0, -8
  br label %58

24:                                               ; preds = %58, %19
  %25 = phi double [ undef, %19 ], [ %180, %58 ]
  %26 = phi i32 [ 0, %19 ], [ %181, %58 ]
  %27 = phi double [ %2, %19 ], [ %180, %58 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %50, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %47, %29 ], [ %26, %24 ]
  %31 = phi double [ %46, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %48, %29 ], [ 0, %24 ]
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !11, !amdgpu.noclobber !5
  %38 = sitofp i32 %37 to double
  %39 = fmul contract double %35, %38
  %40 = mul nsw i32 %30, %0
  %41 = add nsw i32 %40, %15
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %4, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !5
  %45 = fmul contract double %44, %39
  %46 = fadd contract double %31, %45
  %47 = add nuw nsw i32 %30, 1
  %48 = add i32 %32, 1
  %49 = icmp eq i32 %48, %20
  br i1 %49, label %50, label %29, !llvm.loop !13

50:                                               ; preds = %24, %29, %17
  %51 = phi double [ %2, %17 ], [ %25, %24 ], [ %46, %29 ]
  %52 = sext i32 %15 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !11, !amdgpu.noclobber !5
  %55 = sitofp i32 %54 to double
  %56 = fsub contract double %51, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %5, i64 %52
  store double %56, double addrspace(1)* %57, align 8, !tbaa !7
  br label %184

58:                                               ; preds = %58, %22
  %59 = phi i32 [ 0, %22 ], [ %181, %58 ]
  %60 = phi double [ %2, %22 ], [ %180, %58 ]
  %61 = phi i32 [ 0, %22 ], [ %182, %58 ]
  %62 = zext i32 %59 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !11, !amdgpu.noclobber !5
  %67 = sitofp i32 %66 to double
  %68 = fmul contract double %64, %67
  %69 = mul nsw i32 %59, %0
  %70 = add nsw i32 %69, %15
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %4, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7, !amdgpu.noclobber !5
  %74 = fmul contract double %73, %68
  %75 = fadd contract double %60, %74
  %76 = or i32 %59, 1
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7, !amdgpu.noclobber !5
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %77
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !11, !amdgpu.noclobber !5
  %82 = sitofp i32 %81 to double
  %83 = fmul contract double %79, %82
  %84 = mul nsw i32 %76, %0
  %85 = add nsw i32 %84, %15
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %4, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7, !amdgpu.noclobber !5
  %89 = fmul contract double %88, %83
  %90 = fadd contract double %75, %89
  %91 = or i32 %59, 2
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %92
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !11, !amdgpu.noclobber !5
  %97 = sitofp i32 %96 to double
  %98 = fmul contract double %94, %97
  %99 = mul nsw i32 %91, %0
  %100 = add nsw i32 %99, %15
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %4, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7, !amdgpu.noclobber !5
  %104 = fmul contract double %103, %98
  %105 = fadd contract double %90, %104
  %106 = or i32 %59, 3
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7, !amdgpu.noclobber !5
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %107
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !11, !amdgpu.noclobber !5
  %112 = sitofp i32 %111 to double
  %113 = fmul contract double %109, %112
  %114 = mul nsw i32 %106, %0
  %115 = add nsw i32 %114, %15
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %4, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !7, !amdgpu.noclobber !5
  %119 = fmul contract double %118, %113
  %120 = fadd contract double %105, %119
  %121 = or i32 %59, 4
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %1, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !7, !amdgpu.noclobber !5
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %122
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !11, !amdgpu.noclobber !5
  %127 = sitofp i32 %126 to double
  %128 = fmul contract double %124, %127
  %129 = mul nsw i32 %121, %0
  %130 = add nsw i32 %129, %15
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double addrspace(1)* %4, i64 %131
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !7, !amdgpu.noclobber !5
  %134 = fmul contract double %133, %128
  %135 = fadd contract double %120, %134
  %136 = or i32 %59, 5
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds double, double addrspace(1)* %1, i64 %137
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7, !amdgpu.noclobber !5
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %137
  %141 = load i32, i32 addrspace(1)* %140, align 4, !tbaa !11, !amdgpu.noclobber !5
  %142 = sitofp i32 %141 to double
  %143 = fmul contract double %139, %142
  %144 = mul nsw i32 %136, %0
  %145 = add nsw i32 %144, %15
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds double, double addrspace(1)* %4, i64 %146
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7, !amdgpu.noclobber !5
  %149 = fmul contract double %148, %143
  %150 = fadd contract double %135, %149
  %151 = or i32 %59, 6
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds double, double addrspace(1)* %1, i64 %152
  %154 = load double, double addrspace(1)* %153, align 8, !tbaa !7, !amdgpu.noclobber !5
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %152
  %156 = load i32, i32 addrspace(1)* %155, align 4, !tbaa !11, !amdgpu.noclobber !5
  %157 = sitofp i32 %156 to double
  %158 = fmul contract double %154, %157
  %159 = mul nsw i32 %151, %0
  %160 = add nsw i32 %159, %15
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds double, double addrspace(1)* %4, i64 %161
  %163 = load double, double addrspace(1)* %162, align 8, !tbaa !7, !amdgpu.noclobber !5
  %164 = fmul contract double %163, %158
  %165 = fadd contract double %150, %164
  %166 = or i32 %59, 7
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds double, double addrspace(1)* %1, i64 %167
  %169 = load double, double addrspace(1)* %168, align 8, !tbaa !7, !amdgpu.noclobber !5
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %167
  %171 = load i32, i32 addrspace(1)* %170, align 4, !tbaa !11, !amdgpu.noclobber !5
  %172 = sitofp i32 %171 to double
  %173 = fmul contract double %169, %172
  %174 = mul nsw i32 %166, %0
  %175 = add nsw i32 %174, %15
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds double, double addrspace(1)* %4, i64 %176
  %178 = load double, double addrspace(1)* %177, align 8, !tbaa !7, !amdgpu.noclobber !5
  %179 = fmul contract double %178, %173
  %180 = fadd contract double %165, %179
  %181 = add nuw nsw i32 %59, 8
  %182 = add i32 %61, 8
  %183 = icmp eq i32 %182, %23
  br i1 %183, label %24, label %58, !llvm.loop !15

184:                                              ; preds = %50, %6
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
