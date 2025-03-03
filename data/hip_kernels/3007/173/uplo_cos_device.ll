; ModuleID = '../data/hip_kernels/3007/173/main.cu'
source_filename = "../data/hip_kernels/3007/173/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8uplo_cosiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %187

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %187

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp olt float %44, 1.310720e+05
  br i1 %45, label %46, label %53

46:                                               ; preds = %37
  %47 = fmul float %44, 0x3FE45F3060000000
  %48 = tail call float @llvm.rint.f32(float %47)
  %49 = tail call float @llvm.fma.f32(float %48, float 0xBFF921FB40000000, float %44)
  %50 = tail call float @llvm.fma.f32(float %48, float 0xBE74442D00000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %48, float 0xBCF8469880000000, float %50)
  %52 = fptosi float %48 to i32
  br label %159

53:                                               ; preds = %37
  %54 = bitcast float %44 to i32
  %55 = lshr i32 %54, 23
  %56 = and i32 %54, 8388607
  %57 = or i32 %56, 8388608
  %58 = zext i32 %57 to i64
  %59 = mul nuw nsw i64 %58, 4266746795
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %58, 1011060801
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %58, 3680671129
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %58, 4113882560
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %58, 4230436817
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = mul nuw nsw i64 %58, 1313084713
  %79 = add nuw nsw i64 %77, %78
  %80 = trunc i64 %79 to i32
  %81 = lshr i64 %79, 32
  %82 = mul nuw nsw i64 %58, 2734261102
  %83 = add nuw nsw i64 %81, %82
  %84 = trunc i64 %83 to i32
  %85 = lshr i64 %83, 32
  %86 = trunc i64 %85 to i32
  %87 = add nsw i32 %55, -120
  %88 = icmp ugt i32 %87, 63
  %89 = select i1 %88, i32 %80, i32 %86
  %90 = select i1 %88, i32 %76, i32 %84
  %91 = select i1 %88, i32 %72, i32 %80
  %92 = select i1 %88, i32 %68, i32 %76
  %93 = select i1 %88, i32 %64, i32 %72
  %94 = select i1 %88, i32 %60, i32 %68
  %95 = select i1 %88, i32 -64, i32 0
  %96 = add nsw i32 %95, %87
  %97 = icmp ugt i32 %96, 31
  %98 = select i1 %97, i32 %90, i32 %89
  %99 = select i1 %97, i32 %91, i32 %90
  %100 = select i1 %97, i32 %92, i32 %91
  %101 = select i1 %97, i32 %93, i32 %92
  %102 = select i1 %97, i32 %94, i32 %93
  %103 = select i1 %97, i32 -32, i32 0
  %104 = add nsw i32 %103, %96
  %105 = icmp ugt i32 %104, 31
  %106 = select i1 %105, i32 %99, i32 %98
  %107 = select i1 %105, i32 %100, i32 %99
  %108 = select i1 %105, i32 %101, i32 %100
  %109 = select i1 %105, i32 %102, i32 %101
  %110 = select i1 %105, i32 -32, i32 0
  %111 = add nsw i32 %110, %104
  %112 = icmp eq i32 %111, 0
  %113 = sub nsw i32 32, %111
  %114 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %107, i32 %113)
  %115 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %113)
  %116 = tail call i32 @llvm.fshr.i32(i32 %108, i32 %109, i32 %113)
  %117 = select i1 %112, i32 %106, i32 %114
  %118 = select i1 %112, i32 %107, i32 %115
  %119 = select i1 %112, i32 %108, i32 %116
  %120 = lshr i32 %117, 29
  %121 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %118, i32 2)
  %122 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %119, i32 2)
  %123 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %109, i32 2)
  %124 = and i32 %120, 1
  %125 = sub nsw i32 0, %124
  %126 = shl i32 %120, 31
  %127 = xor i32 %121, %125
  %128 = xor i32 %122, %125
  %129 = xor i32 %123, %125
  %130 = tail call i32 @llvm.ctlz.i32(i32 %127, i1 false), !range !11
  %131 = sub nsw i32 31, %130
  %132 = tail call i32 @llvm.fshr.i32(i32 %127, i32 %128, i32 %131)
  %133 = tail call i32 @llvm.fshr.i32(i32 %128, i32 %129, i32 %131)
  %134 = shl nuw nsw i32 %130, 23
  %135 = sub nuw nsw i32 1056964608, %134
  %136 = lshr i32 %132, 9
  %137 = or i32 %136, %135
  %138 = or i32 %137, %126
  %139 = bitcast i32 %138 to float
  %140 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %133, i32 23)
  %141 = tail call i32 @llvm.ctlz.i32(i32 %140, i1 false), !range !11
  %142 = fmul float %139, 0x3FF921FB40000000
  %143 = add nuw nsw i32 %141, %130
  %144 = shl nuw nsw i32 %143, 23
  %145 = sub nuw nsw i32 855638016, %144
  %146 = sub nsw i32 31, %141
  %147 = tail call i32 @llvm.fshr.i32(i32 %140, i32 %133, i32 %146)
  %148 = lshr i32 %147, 9
  %149 = or i32 %145, %148
  %150 = or i32 %149, %126
  %151 = bitcast i32 %150 to float
  %152 = fneg float %142
  %153 = tail call float @llvm.fma.f32(float %139, float 0x3FF921FB40000000, float %152)
  %154 = tail call float @llvm.fma.f32(float %139, float 0x3E74442D00000000, float %153)
  %155 = tail call float @llvm.fma.f32(float %151, float 0x3FF921FB40000000, float %154)
  %156 = fadd float %142, %155
  %157 = lshr i32 %117, 30
  %158 = add nuw nsw i32 %124, %157
  br label %159

159:                                              ; preds = %46, %53
  %160 = phi float [ %51, %46 ], [ %156, %53 ]
  %161 = phi i32 [ %52, %46 ], [ %158, %53 ]
  %162 = fmul float %160, %160
  %163 = tail call float @llvm.fmuladd.f32(float %162, float 0xBF29833040000000, float 0x3F81103880000000)
  %164 = tail call float @llvm.fmuladd.f32(float %162, float %163, float 0xBFC55553A0000000)
  %165 = fmul float %162, %164
  %166 = tail call float @llvm.fmuladd.f32(float %160, float %165, float %160)
  %167 = tail call float @llvm.fmuladd.f32(float %162, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %168 = tail call float @llvm.fmuladd.f32(float %162, float %167, float 0x3FA5557EE0000000)
  %169 = tail call float @llvm.fmuladd.f32(float %162, float %168, float 0xBFE0000080000000)
  %170 = tail call float @llvm.fmuladd.f32(float %162, float %169, float 1.000000e+00)
  %171 = fneg float %166
  %172 = and i32 %161, 1
  %173 = icmp eq i32 %172, 0
  %174 = select i1 %173, float %170, float %171
  %175 = bitcast float %174 to i32
  %176 = shl i32 %161, 30
  %177 = and i32 %176, -2147483648
  %178 = xor i32 %177, %175
  %179 = bitcast i32 %178 to float
  %180 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 504)
  %181 = select i1 %180, float %179, float 0x7FF8000000000000
  %182 = add nsw i32 %18, %7
  %183 = mul nsw i32 %26, %8
  %184 = add nsw i32 %182, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %6, i64 %185
  store float %181, float addrspace(1)* %186, align 4, !tbaa !7
  br label %187

187:                                              ; preds = %9, %159, %30
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
