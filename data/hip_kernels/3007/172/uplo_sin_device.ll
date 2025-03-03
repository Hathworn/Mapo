; ModuleID = '../data/hip_kernels/3007/172/main.cu'
source_filename = "../data/hip_kernels/3007/172/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8uplo_siniiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %191

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %191

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp olt float %44, 1.310720e+05
  br i1 %45, label %46, label %54

46:                                               ; preds = %37
  %47 = fmul float %44, 0x3FE45F3060000000
  %48 = tail call float @llvm.rint.f32(float %47)
  %49 = tail call float @llvm.fma.f32(float %48, float 0xBFF921FB40000000, float %44)
  %50 = tail call float @llvm.fma.f32(float %48, float 0xBE74442D00000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %48, float 0xBCF8469880000000, float %50)
  %52 = fptosi float %48 to i32
  %53 = bitcast float %44 to i32
  br label %160

54:                                               ; preds = %37
  %55 = bitcast float %44 to i32
  %56 = lshr i32 %55, 23
  %57 = and i32 %55, 8388607
  %58 = or i32 %57, 8388608
  %59 = zext i32 %58 to i64
  %60 = mul nuw nsw i64 %59, 4266746795
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %59, 1011060801
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %59, 3680671129
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %59, 4113882560
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %59, 4230436817
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = mul nuw nsw i64 %59, 1313084713
  %80 = add nuw nsw i64 %78, %79
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = mul nuw nsw i64 %59, 2734261102
  %84 = add nuw nsw i64 %82, %83
  %85 = trunc i64 %84 to i32
  %86 = lshr i64 %84, 32
  %87 = trunc i64 %86 to i32
  %88 = add nsw i32 %56, -120
  %89 = icmp ugt i32 %88, 63
  %90 = select i1 %89, i32 %81, i32 %87
  %91 = select i1 %89, i32 %77, i32 %85
  %92 = select i1 %89, i32 %73, i32 %81
  %93 = select i1 %89, i32 %69, i32 %77
  %94 = select i1 %89, i32 %65, i32 %73
  %95 = select i1 %89, i32 %61, i32 %69
  %96 = select i1 %89, i32 -64, i32 0
  %97 = add nsw i32 %96, %88
  %98 = icmp ugt i32 %97, 31
  %99 = select i1 %98, i32 %91, i32 %90
  %100 = select i1 %98, i32 %92, i32 %91
  %101 = select i1 %98, i32 %93, i32 %92
  %102 = select i1 %98, i32 %94, i32 %93
  %103 = select i1 %98, i32 %95, i32 %94
  %104 = select i1 %98, i32 -32, i32 0
  %105 = add nsw i32 %104, %97
  %106 = icmp ugt i32 %105, 31
  %107 = select i1 %106, i32 %100, i32 %99
  %108 = select i1 %106, i32 %101, i32 %100
  %109 = select i1 %106, i32 %102, i32 %101
  %110 = select i1 %106, i32 %103, i32 %102
  %111 = select i1 %106, i32 -32, i32 0
  %112 = add nsw i32 %111, %105
  %113 = icmp eq i32 %112, 0
  %114 = sub nsw i32 32, %112
  %115 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %114)
  %116 = tail call i32 @llvm.fshr.i32(i32 %108, i32 %109, i32 %114)
  %117 = tail call i32 @llvm.fshr.i32(i32 %109, i32 %110, i32 %114)
  %118 = select i1 %113, i32 %107, i32 %115
  %119 = select i1 %113, i32 %108, i32 %116
  %120 = select i1 %113, i32 %109, i32 %117
  %121 = lshr i32 %118, 29
  %122 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %119, i32 2)
  %123 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %120, i32 2)
  %124 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %110, i32 2)
  %125 = and i32 %121, 1
  %126 = sub nsw i32 0, %125
  %127 = shl i32 %121, 31
  %128 = xor i32 %122, %126
  %129 = xor i32 %123, %126
  %130 = xor i32 %124, %126
  %131 = tail call i32 @llvm.ctlz.i32(i32 %128, i1 false), !range !11
  %132 = sub nsw i32 31, %131
  %133 = tail call i32 @llvm.fshr.i32(i32 %128, i32 %129, i32 %132)
  %134 = tail call i32 @llvm.fshr.i32(i32 %129, i32 %130, i32 %132)
  %135 = shl nuw nsw i32 %131, 23
  %136 = sub nuw nsw i32 1056964608, %135
  %137 = lshr i32 %133, 9
  %138 = or i32 %137, %136
  %139 = or i32 %138, %127
  %140 = bitcast i32 %139 to float
  %141 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %134, i32 23)
  %142 = tail call i32 @llvm.ctlz.i32(i32 %141, i1 false), !range !11
  %143 = fmul float %140, 0x3FF921FB40000000
  %144 = add nuw nsw i32 %142, %131
  %145 = shl nuw nsw i32 %144, 23
  %146 = sub nuw nsw i32 855638016, %145
  %147 = sub nsw i32 31, %142
  %148 = tail call i32 @llvm.fshr.i32(i32 %141, i32 %134, i32 %147)
  %149 = lshr i32 %148, 9
  %150 = or i32 %146, %149
  %151 = or i32 %150, %127
  %152 = bitcast i32 %151 to float
  %153 = fneg float %143
  %154 = tail call float @llvm.fma.f32(float %140, float 0x3FF921FB40000000, float %153)
  %155 = tail call float @llvm.fma.f32(float %140, float 0x3E74442D00000000, float %154)
  %156 = tail call float @llvm.fma.f32(float %152, float 0x3FF921FB40000000, float %155)
  %157 = fadd float %143, %156
  %158 = lshr i32 %118, 30
  %159 = add nuw nsw i32 %125, %158
  br label %160

160:                                              ; preds = %46, %54
  %161 = phi i32 [ %53, %46 ], [ %55, %54 ]
  %162 = phi float [ %51, %46 ], [ %157, %54 ]
  %163 = phi i32 [ %52, %46 ], [ %159, %54 ]
  %164 = fmul float %162, %162
  %165 = tail call float @llvm.fmuladd.f32(float %164, float 0xBF29833040000000, float 0x3F81103880000000)
  %166 = tail call float @llvm.fmuladd.f32(float %164, float %165, float 0xBFC55553A0000000)
  %167 = fmul float %164, %166
  %168 = tail call float @llvm.fmuladd.f32(float %162, float %167, float %162)
  %169 = tail call float @llvm.fmuladd.f32(float %164, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %170 = tail call float @llvm.fmuladd.f32(float %164, float %169, float 0x3FA5557EE0000000)
  %171 = tail call float @llvm.fmuladd.f32(float %164, float %170, float 0xBFE0000080000000)
  %172 = tail call float @llvm.fmuladd.f32(float %164, float %171, float 1.000000e+00)
  %173 = and i32 %163, 1
  %174 = icmp eq i32 %173, 0
  %175 = select i1 %174, float %168, float %172
  %176 = bitcast float %175 to i32
  %177 = shl i32 %163, 30
  %178 = and i32 %177, -2147483648
  %179 = bitcast float %43 to i32
  %180 = xor i32 %161, %179
  %181 = xor i32 %180, %178
  %182 = xor i32 %181, %176
  %183 = bitcast i32 %182 to float
  %184 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 504)
  %185 = select i1 %184, float %183, float 0x7FF8000000000000
  %186 = add nsw i32 %18, %7
  %187 = mul nsw i32 %26, %8
  %188 = add nsw i32 %186, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %6, i64 %189
  store float %185, float addrspace(1)* %190, align 4, !tbaa !7
  br label %191

191:                                              ; preds = %9, %160, %30
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
