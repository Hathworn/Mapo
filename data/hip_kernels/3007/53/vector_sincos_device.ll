; ModuleID = '../data/hip_kernels/3007/53/main.cu'
source_filename = "../data/hip_kernels/3007/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13vector_sincosiPKfiiPfiiS1_ii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %183

21:                                               ; preds = %10
  %22 = mul nsw i32 %19, %3
  %23 = add nsw i32 %22, %2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = mul nsw i32 %19, %6
  %28 = add nsw i32 %27, %5
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %31 = mul nsw i32 %19, %9
  %32 = add nsw i32 %31, %8
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %7, i64 %33
  %35 = tail call float @llvm.fabs.f32(float %26)
  %36 = fcmp olt float %35, 1.310720e+05
  br i1 %36, label %37, label %45

37:                                               ; preds = %21
  %38 = fmul float %35, 0x3FE45F3060000000
  %39 = tail call float @llvm.rint.f32(float %38)
  %40 = tail call float @llvm.fma.f32(float %39, float 0xBFF921FB40000000, float %35)
  %41 = tail call float @llvm.fma.f32(float %39, float 0xBE74442D00000000, float %40)
  %42 = tail call float @llvm.fma.f32(float %39, float 0xBCF8469880000000, float %41)
  %43 = fptosi float %39 to i32
  %44 = bitcast float %35 to i32
  br label %151

45:                                               ; preds = %21
  %46 = bitcast float %35 to i32
  %47 = lshr i32 %46, 23
  %48 = and i32 %46, 8388607
  %49 = or i32 %48, 8388608
  %50 = zext i32 %49 to i64
  %51 = mul nuw nsw i64 %50, 4266746795
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %50, 1011060801
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %50, 3680671129
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %50, 4113882560
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %50, 4230436817
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %50, 1313084713
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %50, 2734261102
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = trunc i64 %77 to i32
  %79 = add nsw i32 %47, -120
  %80 = icmp ugt i32 %79, 63
  %81 = select i1 %80, i32 %72, i32 %78
  %82 = select i1 %80, i32 %68, i32 %76
  %83 = select i1 %80, i32 %64, i32 %72
  %84 = select i1 %80, i32 %60, i32 %68
  %85 = select i1 %80, i32 %56, i32 %64
  %86 = select i1 %80, i32 %52, i32 %60
  %87 = select i1 %80, i32 -64, i32 0
  %88 = add nsw i32 %87, %79
  %89 = icmp ugt i32 %88, 31
  %90 = select i1 %89, i32 %82, i32 %81
  %91 = select i1 %89, i32 %83, i32 %82
  %92 = select i1 %89, i32 %84, i32 %83
  %93 = select i1 %89, i32 %85, i32 %84
  %94 = select i1 %89, i32 %86, i32 %85
  %95 = select i1 %89, i32 -32, i32 0
  %96 = add nsw i32 %95, %88
  %97 = icmp ugt i32 %96, 31
  %98 = select i1 %97, i32 %91, i32 %90
  %99 = select i1 %97, i32 %92, i32 %91
  %100 = select i1 %97, i32 %93, i32 %92
  %101 = select i1 %97, i32 %94, i32 %93
  %102 = select i1 %97, i32 -32, i32 0
  %103 = add nsw i32 %102, %96
  %104 = icmp eq i32 %103, 0
  %105 = sub nsw i32 32, %103
  %106 = tail call i32 @llvm.fshr.i32(i32 %98, i32 %99, i32 %105)
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %105)
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %105)
  %109 = select i1 %104, i32 %98, i32 %106
  %110 = select i1 %104, i32 %99, i32 %107
  %111 = select i1 %104, i32 %100, i32 %108
  %112 = lshr i32 %109, 29
  %113 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %110, i32 2)
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %111, i32 2)
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %101, i32 2)
  %116 = and i32 %112, 1
  %117 = sub nsw i32 0, %116
  %118 = shl i32 %112, 31
  %119 = xor i32 %113, %117
  %120 = xor i32 %114, %117
  %121 = xor i32 %115, %117
  %122 = tail call i32 @llvm.ctlz.i32(i32 %119, i1 false), !range !11
  %123 = sub nsw i32 31, %122
  %124 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %123)
  %125 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %123)
  %126 = shl nuw nsw i32 %122, 23
  %127 = sub nuw nsw i32 1056964608, %126
  %128 = lshr i32 %124, 9
  %129 = or i32 %128, %127
  %130 = or i32 %129, %118
  %131 = bitcast i32 %130 to float
  %132 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %125, i32 23)
  %133 = tail call i32 @llvm.ctlz.i32(i32 %132, i1 false), !range !11
  %134 = fmul float %131, 0x3FF921FB40000000
  %135 = add nuw nsw i32 %133, %122
  %136 = shl nuw nsw i32 %135, 23
  %137 = sub nuw nsw i32 855638016, %136
  %138 = sub nsw i32 31, %133
  %139 = tail call i32 @llvm.fshr.i32(i32 %132, i32 %125, i32 %138)
  %140 = lshr i32 %139, 9
  %141 = or i32 %137, %140
  %142 = or i32 %141, %118
  %143 = bitcast i32 %142 to float
  %144 = fneg float %134
  %145 = tail call float @llvm.fma.f32(float %131, float 0x3FF921FB40000000, float %144)
  %146 = tail call float @llvm.fma.f32(float %131, float 0x3E74442D00000000, float %145)
  %147 = tail call float @llvm.fma.f32(float %143, float 0x3FF921FB40000000, float %146)
  %148 = fadd float %134, %147
  %149 = lshr i32 %109, 30
  %150 = add nuw nsw i32 %116, %149
  br label %151

151:                                              ; preds = %37, %45
  %152 = phi i32 [ %44, %37 ], [ %46, %45 ]
  %153 = phi float [ %42, %37 ], [ %148, %45 ]
  %154 = phi i32 [ %43, %37 ], [ %150, %45 ]
  %155 = fmul float %153, %153
  %156 = tail call float @llvm.fmuladd.f32(float %155, float 0xBF29833040000000, float 0x3F81103880000000)
  %157 = tail call float @llvm.fmuladd.f32(float %155, float %156, float 0xBFC55553A0000000)
  %158 = fmul float %155, %157
  %159 = tail call float @llvm.fmuladd.f32(float %153, float %158, float %153)
  %160 = tail call float @llvm.fmuladd.f32(float %155, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %161 = tail call float @llvm.fmuladd.f32(float %155, float %160, float 0x3FA5557EE0000000)
  %162 = tail call float @llvm.fmuladd.f32(float %155, float %161, float 0xBFE0000080000000)
  %163 = tail call float @llvm.fmuladd.f32(float %155, float %162, float 1.000000e+00)
  %164 = shl i32 %154, 30
  %165 = and i32 %164, -2147483648
  %166 = and i32 %154, 1
  %167 = icmp eq i32 %166, 0
  %168 = select i1 %167, float %159, float %163
  %169 = bitcast float %168 to i32
  %170 = bitcast float %26 to i32
  %171 = xor i32 %152, %170
  %172 = xor i32 %171, %169
  %173 = xor i32 %172, %165
  %174 = bitcast i32 %173 to float
  %175 = fneg float %159
  %176 = select i1 %167, float %163, float %175
  %177 = bitcast float %176 to i32
  %178 = xor i32 %165, %177
  %179 = bitcast i32 %178 to float
  %180 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 504)
  %181 = select i1 %180, float %179, float 0x7FF8000000000000
  %182 = select i1 %180, float %174, float 0x7FF8000000000000
  store float %182, float addrspace(1)* %30, align 4, !tbaa !7
  store float %181, float addrspace(1)* %34, align 4, !tbaa !7
  br label %183

183:                                              ; preds = %151, %10
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
