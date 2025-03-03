; ModuleID = '../data/hip_kernels/10389/5/main.cu'
source_filename = "../data/hip_kernels/10389/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17fourier_transformPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %187

16:                                               ; preds = %5
  %17 = icmp sgt i32 %3, 0
  %18 = mul nsw i32 %14, %2
  %19 = mul nsw i32 %14, %3
  %20 = sitofp i32 %2 to double
  br label %21

21:                                               ; preds = %16, %180
  %22 = phi i32 [ 0, %16 ], [ %185, %180 ]
  br i1 %17, label %23, label %180

23:                                               ; preds = %21
  %24 = add nsw i32 %22, %19
  %25 = sitofp i32 %24 to double
  br label %26

26:                                               ; preds = %23, %153
  %27 = phi float [ 0.000000e+00, %23 ], [ %177, %153 ]
  %28 = phi i32 [ 0, %23 ], [ %178, %153 ]
  %29 = add nsw i32 %28, %18
  %30 = sitofp i32 %29 to double
  %31 = fmul contract double %30, 0x401921FB54442D18
  %32 = fmul contract double %31, %25
  %33 = fdiv contract double %32, %20
  %34 = fptrunc double %33 to float
  %35 = sext i32 %29 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = tail call float @llvm.fabs.f32(float %34)
  %39 = fcmp olt float %38, 1.310720e+05
  br i1 %39, label %40, label %47

40:                                               ; preds = %26
  %41 = fmul float %38, 0x3FE45F3060000000
  %42 = tail call float @llvm.rint.f32(float %41)
  %43 = tail call float @llvm.fma.f32(float %42, float 0xBFF921FB40000000, float %38)
  %44 = tail call float @llvm.fma.f32(float %42, float 0xBE74442D00000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %42, float 0xBCF8469880000000, float %44)
  %46 = fptosi float %42 to i32
  br label %153

47:                                               ; preds = %26
  %48 = bitcast float %38 to i32
  %49 = lshr i32 %48, 23
  %50 = and i32 %48, 8388607
  %51 = or i32 %50, 8388608
  %52 = zext i32 %51 to i64
  %53 = mul nuw nsw i64 %52, 4266746795
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %52, 1011060801
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %52, 3680671129
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %52, 4113882560
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = mul nuw nsw i64 %52, 4230436817
  %69 = add nuw nsw i64 %67, %68
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = mul nuw nsw i64 %52, 1313084713
  %73 = add nuw nsw i64 %71, %72
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %52, 2734261102
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = trunc i64 %79 to i32
  %81 = add nsw i32 %49, -120
  %82 = icmp ugt i32 %81, 63
  %83 = select i1 %82, i32 %74, i32 %80
  %84 = select i1 %82, i32 %70, i32 %78
  %85 = select i1 %82, i32 %66, i32 %74
  %86 = select i1 %82, i32 %62, i32 %70
  %87 = select i1 %82, i32 %58, i32 %66
  %88 = select i1 %82, i32 %54, i32 %62
  %89 = select i1 %82, i32 -64, i32 0
  %90 = add nsw i32 %89, %81
  %91 = icmp ugt i32 %90, 31
  %92 = select i1 %91, i32 %84, i32 %83
  %93 = select i1 %91, i32 %85, i32 %84
  %94 = select i1 %91, i32 %86, i32 %85
  %95 = select i1 %91, i32 %87, i32 %86
  %96 = select i1 %91, i32 %88, i32 %87
  %97 = select i1 %91, i32 -32, i32 0
  %98 = add nsw i32 %97, %90
  %99 = icmp ugt i32 %98, 31
  %100 = select i1 %99, i32 %93, i32 %92
  %101 = select i1 %99, i32 %94, i32 %93
  %102 = select i1 %99, i32 %95, i32 %94
  %103 = select i1 %99, i32 %96, i32 %95
  %104 = select i1 %99, i32 -32, i32 0
  %105 = add nsw i32 %104, %98
  %106 = icmp eq i32 %105, 0
  %107 = sub nsw i32 32, %105
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %107)
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %107)
  %110 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %107)
  %111 = select i1 %106, i32 %100, i32 %108
  %112 = select i1 %106, i32 %101, i32 %109
  %113 = select i1 %106, i32 %102, i32 %110
  %114 = lshr i32 %111, 29
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 2)
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %113, i32 2)
  %117 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %103, i32 2)
  %118 = and i32 %114, 1
  %119 = sub nsw i32 0, %118
  %120 = shl i32 %114, 31
  %121 = xor i32 %115, %119
  %122 = xor i32 %116, %119
  %123 = xor i32 %117, %119
  %124 = tail call i32 @llvm.ctlz.i32(i32 %121, i1 false), !range !11
  %125 = sub nsw i32 31, %124
  %126 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %125)
  %127 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %123, i32 %125)
  %128 = shl nuw nsw i32 %124, 23
  %129 = sub nuw nsw i32 1056964608, %128
  %130 = lshr i32 %126, 9
  %131 = or i32 %130, %129
  %132 = or i32 %131, %120
  %133 = bitcast i32 %132 to float
  %134 = tail call i32 @llvm.fshl.i32(i32 %126, i32 %127, i32 23)
  %135 = tail call i32 @llvm.ctlz.i32(i32 %134, i1 false), !range !11
  %136 = fmul float %133, 0x3FF921FB40000000
  %137 = add nuw nsw i32 %135, %124
  %138 = shl nuw nsw i32 %137, 23
  %139 = sub nuw nsw i32 855638016, %138
  %140 = sub nsw i32 31, %135
  %141 = tail call i32 @llvm.fshr.i32(i32 %134, i32 %127, i32 %140)
  %142 = lshr i32 %141, 9
  %143 = or i32 %139, %142
  %144 = or i32 %143, %120
  %145 = bitcast i32 %144 to float
  %146 = fneg float %136
  %147 = tail call float @llvm.fma.f32(float %133, float 0x3FF921FB40000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %133, float 0x3E74442D00000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %145, float 0x3FF921FB40000000, float %148)
  %150 = fadd float %136, %149
  %151 = lshr i32 %111, 30
  %152 = add nuw nsw i32 %118, %151
  br label %153

153:                                              ; preds = %40, %47
  %154 = phi float [ %45, %40 ], [ %150, %47 ]
  %155 = phi i32 [ %46, %40 ], [ %152, %47 ]
  %156 = fmul float %154, %154
  %157 = tail call float @llvm.fmuladd.f32(float %156, float 0xBF29833040000000, float 0x3F81103880000000)
  %158 = tail call float @llvm.fmuladd.f32(float %156, float %157, float 0xBFC55553A0000000)
  %159 = fmul float %156, %158
  %160 = tail call float @llvm.fmuladd.f32(float %154, float %159, float %154)
  %161 = tail call float @llvm.fmuladd.f32(float %156, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %162 = tail call float @llvm.fmuladd.f32(float %156, float %161, float 0x3FA5557EE0000000)
  %163 = tail call float @llvm.fmuladd.f32(float %156, float %162, float 0xBFE0000080000000)
  %164 = tail call float @llvm.fmuladd.f32(float %156, float %163, float 1.000000e+00)
  %165 = fneg float %160
  %166 = and i32 %155, 1
  %167 = icmp eq i32 %166, 0
  %168 = select i1 %167, float %164, float %165
  %169 = bitcast float %168 to i32
  %170 = shl i32 %155, 30
  %171 = and i32 %170, -2147483648
  %172 = xor i32 %171, %169
  %173 = bitcast i32 %172 to float
  %174 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 504)
  %175 = select i1 %174, float %173, float 0x7FF8000000000000
  %176 = fmul contract float %37, %175
  %177 = fadd contract float %27, %176
  %178 = add nuw nsw i32 %28, 1
  %179 = icmp eq i32 %178, %3
  br i1 %179, label %180, label %26, !llvm.loop !12

180:                                              ; preds = %153, %21
  %181 = phi float [ 0.000000e+00, %21 ], [ %177, %153 ]
  %182 = add nsw i32 %22, %18
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  store float %181, float addrspace(1)* %184, align 4, !tbaa !7
  %185 = add nuw nsw i32 %22, 1
  %186 = icmp eq i32 %185, %2
  br i1 %186, label %187, label %21, !llvm.loop !14

187:                                              ; preds = %180, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{i32 0, i32 33}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
