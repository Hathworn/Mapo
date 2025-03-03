; ModuleID = '../data/hip_kernels/15412/157/main.cu'
source_filename = "../data/hip_kernels/15412/157/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40activate_array_normalize_channels_kernelPfiiiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = freeze i32 %4
  %18 = sdiv i32 %16, %17
  %19 = mul i32 %18, %17
  %20 = sub i32 %16, %19
  %21 = icmp slt i32 %15, %1
  br i1 %21, label %22, label %186

22:                                               ; preds = %6
  %23 = icmp sgt i32 %3, 0
  br i1 %23, label %24, label %51

24:                                               ; preds = %22
  %25 = mul i32 %18, %3
  %26 = and i32 %3, 7
  %27 = icmp ult i32 %3, 8
  br i1 %27, label %30, label %28

28:                                               ; preds = %24
  %29 = and i32 %3, -8
  br label %59

30:                                               ; preds = %59, %24
  %31 = phi float [ undef, %24 ], [ %141, %59 ]
  %32 = phi float [ 0x3F1A36E2E0000000, %24 ], [ %141, %59 ]
  %33 = phi i32 [ 0, %24 ], [ %142, %59 ]
  %34 = icmp eq i32 %26, 0
  br i1 %34, label %51, label %35

35:                                               ; preds = %30, %35
  %36 = phi float [ %47, %35 ], [ %32, %30 ]
  %37 = phi i32 [ %48, %35 ], [ %33, %30 ]
  %38 = phi i32 [ %49, %35 ], [ 0, %30 ]
  %39 = add i32 %37, %25
  %40 = mul i32 %39, %4
  %41 = add i32 %40, %20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = fcmp contract ogt float %44, -0.000000e+00
  %46 = select i1 %45, float %44, float -0.000000e+00
  %47 = fadd contract float %36, %46
  %48 = add nuw nsw i32 %37, 1
  %49 = add i32 %38, 1
  %50 = icmp eq i32 %49, %26
  br i1 %50, label %51, label %35, !llvm.loop !11

51:                                               ; preds = %30, %35, %22
  %52 = phi float [ 0x3F1A36E2E0000000, %22 ], [ %31, %30 ], [ %47, %35 ]
  br i1 %23, label %53, label %186

53:                                               ; preds = %51
  %54 = mul i32 %18, %3
  %55 = and i32 %3, 1
  %56 = icmp eq i32 %3, 1
  br i1 %56, label %172, label %57

57:                                               ; preds = %53
  %58 = and i32 %3, -2
  br label %145

59:                                               ; preds = %59, %28
  %60 = phi float [ 0x3F1A36E2E0000000, %28 ], [ %141, %59 ]
  %61 = phi i32 [ 0, %28 ], [ %142, %59 ]
  %62 = phi i32 [ 0, %28 ], [ %143, %59 ]
  %63 = add i32 %61, %25
  %64 = mul i32 %63, %4
  %65 = add i32 %64, %20
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fcmp contract ogt float %68, -0.000000e+00
  %70 = select i1 %69, float %68, float -0.000000e+00
  %71 = fadd contract float %60, %70
  %72 = or i32 %61, 1
  %73 = add i32 %72, %25
  %74 = mul i32 %73, %4
  %75 = add i32 %74, %20
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fcmp contract ogt float %78, -0.000000e+00
  %80 = select i1 %79, float %78, float -0.000000e+00
  %81 = fadd contract float %71, %80
  %82 = or i32 %61, 2
  %83 = add i32 %82, %25
  %84 = mul i32 %83, %4
  %85 = add i32 %84, %20
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = fcmp contract ogt float %88, -0.000000e+00
  %90 = select i1 %89, float %88, float -0.000000e+00
  %91 = fadd contract float %81, %90
  %92 = or i32 %61, 3
  %93 = add i32 %92, %25
  %94 = mul i32 %93, %4
  %95 = add i32 %94, %20
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = fcmp contract ogt float %98, -0.000000e+00
  %100 = select i1 %99, float %98, float -0.000000e+00
  %101 = fadd contract float %91, %100
  %102 = or i32 %61, 4
  %103 = add i32 %102, %25
  %104 = mul i32 %103, %4
  %105 = add i32 %104, %20
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = fcmp contract ogt float %108, -0.000000e+00
  %110 = select i1 %109, float %108, float -0.000000e+00
  %111 = fadd contract float %101, %110
  %112 = or i32 %61, 5
  %113 = add i32 %112, %25
  %114 = mul i32 %113, %4
  %115 = add i32 %114, %20
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = fcmp contract ogt float %118, -0.000000e+00
  %120 = select i1 %119, float %118, float -0.000000e+00
  %121 = fadd contract float %111, %120
  %122 = or i32 %61, 6
  %123 = add i32 %122, %25
  %124 = mul i32 %123, %4
  %125 = add i32 %124, %20
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !7, !amdgpu.noclobber !5
  %129 = fcmp contract ogt float %128, -0.000000e+00
  %130 = select i1 %129, float %128, float -0.000000e+00
  %131 = fadd contract float %121, %130
  %132 = or i32 %61, 7
  %133 = add i32 %132, %25
  %134 = mul i32 %133, %4
  %135 = add i32 %134, %20
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = fcmp contract ogt float %138, -0.000000e+00
  %140 = select i1 %139, float %138, float -0.000000e+00
  %141 = fadd contract float %131, %140
  %142 = add nuw nsw i32 %61, 8
  %143 = add i32 %62, 8
  %144 = icmp eq i32 %143, %29
  br i1 %144, label %30, label %59, !llvm.loop !13

145:                                              ; preds = %145, %57
  %146 = phi i32 [ 0, %57 ], [ %169, %145 ]
  %147 = phi i32 [ 0, %57 ], [ %170, %145 ]
  %148 = add i32 %146, %54
  %149 = mul i32 %148, %4
  %150 = add i32 %149, %20
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7
  %154 = fcmp contract ogt float %153, 0.000000e+00
  %155 = fdiv contract float %153, %52
  %156 = select i1 %154, float %155, float 0.000000e+00
  %157 = getelementptr inbounds float, float addrspace(1)* %5, i64 %151
  store float %156, float addrspace(1)* %157, align 4, !tbaa !7
  %158 = or i32 %146, 1
  %159 = add i32 %158, %54
  %160 = mul i32 %159, %4
  %161 = add i32 %160, %20
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = fcmp contract ogt float %164, 0.000000e+00
  %166 = fdiv contract float %164, %52
  %167 = select i1 %165, float %166, float 0.000000e+00
  %168 = getelementptr inbounds float, float addrspace(1)* %5, i64 %162
  store float %167, float addrspace(1)* %168, align 4, !tbaa !7
  %169 = add nuw nsw i32 %146, 2
  %170 = add i32 %147, 2
  %171 = icmp eq i32 %170, %58
  br i1 %171, label %172, label %145, !llvm.loop !15

172:                                              ; preds = %145, %53
  %173 = phi i32 [ 0, %53 ], [ %169, %145 ]
  %174 = icmp eq i32 %55, 0
  br i1 %174, label %186, label %175

175:                                              ; preds = %172
  %176 = add i32 %173, %54
  %177 = mul i32 %176, %4
  %178 = add i32 %177, %20
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fcmp contract ogt float %181, 0.000000e+00
  %183 = fdiv contract float %181, %52
  %184 = select i1 %182, float %183, float 0.000000e+00
  %185 = getelementptr inbounds float, float addrspace(1)* %5, i64 %179
  store float %184, float addrspace(1)* %185, align 4, !tbaa !7
  br label %186

186:                                              ; preds = %175, %172, %51, %6
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
