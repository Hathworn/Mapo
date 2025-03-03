; ModuleID = '../data/hip_kernels/4154/6/main.cu'
source_filename = "../data/hip_kernels/4154/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL18convertToRGBKernelPKtPtiii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL18convertToRGBKernelPKtPtiii(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 comdat {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = sdiv i32 %2, 8
  %24 = icmp slt i32 %14, %23
  %25 = icmp slt i32 %22, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %239

27:                                               ; preds = %5
  %28 = mul nsw i32 %22, %2
  %29 = shl nsw i32 %14, 3
  %30 = add nsw i32 %28, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %31
  %33 = load i16, i16 addrspace(1)* %32, align 2, !tbaa !7, !amdgpu.noclobber !5
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 %30, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %36
  %38 = load i16, i16 addrspace(1)* %37, align 2, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i16 %38 to i32
  %40 = shl nuw i32 %39, 16
  %41 = or i32 %40, %34
  %42 = add nsw i32 %30, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %43
  %45 = load i16, i16 addrspace(1)* %44, align 2, !tbaa !7, !amdgpu.noclobber !5
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %30, 3
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %48
  %50 = load i16, i16 addrspace(1)* %49, align 2, !tbaa !7, !amdgpu.noclobber !5
  %51 = zext i16 %50 to i32
  %52 = shl nuw i32 %51, 16
  %53 = or i32 %52, %46
  %54 = add nsw i32 %30, 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %55
  %57 = load i16, i16 addrspace(1)* %56, align 2, !tbaa !7, !amdgpu.noclobber !5
  %58 = zext i16 %57 to i32
  %59 = add nsw i32 %30, 5
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %60
  %62 = load i16, i16 addrspace(1)* %61, align 2, !tbaa !7, !amdgpu.noclobber !5
  %63 = zext i16 %62 to i32
  %64 = shl nuw i32 %63, 16
  %65 = or i32 %64, %58
  %66 = add nsw i32 %30, 6
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %67
  %69 = load i16, i16 addrspace(1)* %68, align 2, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i16 %69 to i32
  %71 = add nsw i32 %30, 7
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %72
  %74 = load i16, i16 addrspace(1)* %73, align 2, !tbaa !7, !amdgpu.noclobber !5
  %75 = zext i16 %74 to i32
  %76 = shl nuw i32 %75, 16
  %77 = or i32 %76, %70
  %78 = lshr i32 %39, 4
  %79 = and i32 %78, 1023
  %80 = lshr i32 %41, 10
  %81 = and i32 %80, 1023
  %82 = mul nuw nsw i32 %81, 1000
  %83 = and i32 %34, 1023
  %84 = lshr i32 %51, 4
  %85 = and i32 %84, 1023
  %86 = mul nuw nsw i32 %85, 1000
  %87 = lshr i32 %53, 10
  %88 = and i32 %87, 1023
  %89 = and i32 %46, 1023
  %90 = mul nuw nsw i32 %89, 1000
  %91 = lshr i32 %63, 4
  %92 = and i32 %91, 1023
  %93 = lshr i32 %65, 10
  %94 = and i32 %93, 1023
  %95 = mul nuw nsw i32 %94, 1000
  %96 = and i32 %58, 1023
  %97 = lshr i32 %75, 4
  %98 = and i32 %97, 1023
  %99 = mul nuw nsw i32 %98, 1000
  %100 = lshr i32 %77, 10
  %101 = and i32 %100, 1023
  %102 = and i32 %70, 1023
  %103 = mul nuw nsw i32 %102, 1000
  %104 = mul nsw i32 %14, 18
  %105 = mul nsw i32 %28, 9
  %106 = sdiv i32 %105, 4
  %107 = mul nuw nsw i32 %79, 1407
  %108 = add nsw i32 %107, -720384
  %109 = mul nuw nsw i32 %79, 716
  %110 = mul nuw nsw i32 %83, 345
  %111 = add nuw nsw i32 %110, -543232
  %112 = add nsw i32 %111, %109
  %113 = mul nuw nsw i32 %83, 1779
  %114 = add nsw i32 %113, -910848
  %115 = add nsw i32 %82, %108
  %116 = udiv i32 %115, 1000
  %117 = trunc i32 %116 to i16
  %118 = add nsw i32 %106, %104
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %119
  store i16 %117, i16 addrspace(1)* %120, align 2, !tbaa !7
  %121 = sub nsw i32 %82, %112
  %122 = udiv i32 %121, 1000
  %123 = trunc i32 %122 to i16
  %124 = add nsw i32 %118, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %125
  store i16 %123, i16 addrspace(1)* %126, align 2, !tbaa !7
  %127 = add nsw i32 %82, %114
  %128 = udiv i32 %127, 1000
  %129 = trunc i32 %128 to i16
  %130 = add nsw i32 %118, 2
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %131
  store i16 %129, i16 addrspace(1)* %132, align 2, !tbaa !7
  %133 = add nsw i32 %108, %90
  %134 = udiv i32 %133, 1000
  %135 = trunc i32 %134 to i16
  %136 = add nsw i32 %118, 3
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %137
  store i16 %135, i16 addrspace(1)* %138, align 2, !tbaa !7
  %139 = sub nsw i32 %90, %112
  %140 = udiv i32 %139, 1000
  %141 = trunc i32 %140 to i16
  %142 = add nsw i32 %118, 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %143
  store i16 %141, i16 addrspace(1)* %144, align 2, !tbaa !7
  %145 = add nsw i32 %90, %114
  %146 = udiv i32 %145, 1000
  %147 = trunc i32 %146 to i16
  %148 = add nsw i32 %118, 5
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %149
  store i16 %147, i16 addrspace(1)* %150, align 2, !tbaa !7
  %151 = mul nuw nsw i32 %96, 1407
  %152 = add nsw i32 %151, -720384
  %153 = mul nuw nsw i32 %96, 716
  %154 = mul nuw nsw i32 %88, 345
  %155 = add nsw i32 %153, -543232
  %156 = add nsw i32 %155, %154
  %157 = mul nuw nsw i32 %88, 1779
  %158 = add nsw i32 %157, -910848
  %159 = add nsw i32 %152, %86
  %160 = udiv i32 %159, 1000
  %161 = trunc i32 %160 to i16
  %162 = add nsw i32 %118, 6
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %163
  store i16 %161, i16 addrspace(1)* %164, align 2, !tbaa !7
  %165 = sub nsw i32 %86, %156
  %166 = udiv i32 %165, 1000
  %167 = trunc i32 %166 to i16
  %168 = add nsw i32 %118, 7
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %169
  store i16 %167, i16 addrspace(1)* %170, align 2, !tbaa !7
  %171 = add nsw i32 %158, %86
  %172 = udiv i32 %171, 1000
  %173 = trunc i32 %172 to i16
  %174 = add nsw i32 %118, 8
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %175
  store i16 %173, i16 addrspace(1)* %176, align 2, !tbaa !7
  %177 = add nsw i32 %95, %152
  %178 = udiv i32 %177, 1000
  %179 = trunc i32 %178 to i16
  %180 = add nsw i32 %118, 9
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %181
  store i16 %179, i16 addrspace(1)* %182, align 2, !tbaa !7
  %183 = sub nsw i32 %95, %156
  %184 = udiv i32 %183, 1000
  %185 = trunc i32 %184 to i16
  %186 = add nsw i32 %118, 10
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %187
  store i16 %185, i16 addrspace(1)* %188, align 2, !tbaa !7
  %189 = add nsw i32 %95, %158
  %190 = udiv i32 %189, 1000
  %191 = trunc i32 %190 to i16
  %192 = add nsw i32 %118, 11
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %193
  store i16 %191, i16 addrspace(1)* %194, align 2, !tbaa !7
  %195 = mul nuw nsw i32 %101, 1407
  %196 = add nsw i32 %195, -720384
  %197 = mul nuw nsw i32 %101, 716
  %198 = mul nuw nsw i32 %92, 345
  %199 = add nuw nsw i32 %198, -543232
  %200 = add nsw i32 %199, %197
  %201 = mul nuw nsw i32 %92, 1779
  %202 = add nsw i32 %201, -910848
  %203 = add nsw i32 %196, %103
  %204 = udiv i32 %203, 1000
  %205 = trunc i32 %204 to i16
  %206 = add nsw i32 %118, 12
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %207
  store i16 %205, i16 addrspace(1)* %208, align 2, !tbaa !7
  %209 = sub nsw i32 %103, %200
  %210 = udiv i32 %209, 1000
  %211 = trunc i32 %210 to i16
  %212 = add nsw i32 %118, 13
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %213
  store i16 %211, i16 addrspace(1)* %214, align 2, !tbaa !7
  %215 = add nsw i32 %202, %103
  %216 = udiv i32 %215, 1000
  %217 = trunc i32 %216 to i16
  %218 = add nsw i32 %118, 14
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %219
  store i16 %217, i16 addrspace(1)* %220, align 2, !tbaa !7
  %221 = add nsw i32 %196, %99
  %222 = udiv i32 %221, 1000
  %223 = trunc i32 %222 to i16
  %224 = add nsw i32 %118, 15
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %225
  store i16 %223, i16 addrspace(1)* %226, align 2, !tbaa !7
  %227 = sub nsw i32 %99, %200
  %228 = udiv i32 %227, 1000
  %229 = trunc i32 %228 to i16
  %230 = add nsw i32 %118, 16
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %231
  store i16 %229, i16 addrspace(1)* %232, align 2, !tbaa !7
  %233 = add nsw i32 %99, %202
  %234 = udiv i32 %233, 1000
  %235 = trunc i32 %234 to i16
  %236 = add nsw i32 %118, 17
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %237
  store i16 %235, i16 addrspace(1)* %238, align 2, !tbaa !7
  br label %239

239:                                              ; preds = %27, %5
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
