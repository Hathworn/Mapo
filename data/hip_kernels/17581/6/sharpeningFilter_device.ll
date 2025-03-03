; ModuleID = '../data/hip_kernels/17581/6/main.cu'
source_filename = "../data/hip_kernels/17581/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16sharpeningFilterPhS_jji(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  %23 = icmp sgt i32 %14, 0
  br i1 %23, label %24, label %211

24:                                               ; preds = %5
  %25 = add i32 %2, -1
  %26 = icmp ult i32 %14, %25
  %27 = icmp sgt i32 %22, 0
  %28 = select i1 %26, i1 %27, i1 false
  %29 = add i32 %3, -1
  %30 = icmp ult i32 %22, %29
  %31 = select i1 %28, i1 %30, i1 false
  %32 = icmp sgt i32 %4, 0
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %211

34:                                               ; preds = %24
  %35 = mul i32 %22, %2
  %36 = add i32 %35, %14
  %37 = mul i32 %36, %4
  %38 = add nuw nsw i32 %22, 1
  %39 = mul i32 %38, %2
  %40 = add i32 %39, %14
  %41 = add i32 %40, -1
  %42 = mul i32 %41, %4
  %43 = add nsw i32 %22, -1
  %44 = mul i32 %43, %2
  %45 = add i32 %44, %14
  %46 = add i32 %45, -1
  %47 = mul i32 %46, %4
  %48 = mul i32 %45, %4
  %49 = add i32 %45, 1
  %50 = mul i32 %49, %4
  %51 = add i32 %36, -1
  %52 = mul i32 %51, %4
  %53 = add i32 %36, 1
  %54 = mul i32 %53, %4
  %55 = mul i32 %40, %4
  %56 = add i32 %40, 1
  %57 = mul i32 %56, %4
  %58 = and i32 %4, 1
  %59 = icmp eq i32 %4, 1
  br i1 %59, label %161, label %60

60:                                               ; preds = %34
  %61 = and i32 %4, -2
  br label %62

62:                                               ; preds = %62, %60
  %63 = phi i32 [ 0, %60 ], [ %158, %62 ]
  %64 = phi i32 [ 0, %60 ], [ %159, %62 ]
  %65 = add i32 %47, %63
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7
  %69 = add i32 %48, %63
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %70
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7
  %73 = add i8 %68, %72
  %74 = add i32 %50, %63
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7
  %78 = add i8 %73, %77
  %79 = add i32 %52, %63
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7
  %83 = add i8 %78, %82
  %84 = add i32 %37, %63
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !7
  %88 = mul i8 %87, 9
  %89 = add i32 %54, %63
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7
  %93 = add i8 %83, %92
  %94 = add i32 %42, %63
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7
  %98 = add i8 %93, %97
  %99 = add i32 %55, %63
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !7
  %103 = add i8 %98, %102
  %104 = add i32 %57, %63
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !7
  %108 = add i8 %103, %107
  %109 = sub i8 %88, %108
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %85
  store i8 %109, i8 addrspace(1)* %110, align 1, !tbaa !7
  %111 = or i32 %63, 1
  %112 = add i32 %47, %111
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %113
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !7
  %116 = add i32 %48, %111
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7
  %120 = add i8 %115, %119
  %121 = add i32 %50, %111
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !7
  %125 = add i8 %120, %124
  %126 = add i32 %52, %111
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %127
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !7
  %130 = add i8 %125, %129
  %131 = add i32 %37, %111
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %132
  %134 = load i8, i8 addrspace(1)* %133, align 1, !tbaa !7
  %135 = mul i8 %134, 9
  %136 = add i32 %54, %111
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %137
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !7
  %140 = add i8 %130, %139
  %141 = add i32 %42, %111
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !7
  %145 = add i8 %140, %144
  %146 = add i32 %55, %111
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %147
  %149 = load i8, i8 addrspace(1)* %148, align 1, !tbaa !7
  %150 = add i8 %145, %149
  %151 = add i32 %57, %111
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !7
  %155 = add i8 %150, %154
  %156 = sub i8 %135, %155
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %132
  store i8 %156, i8 addrspace(1)* %157, align 1, !tbaa !7
  %158 = add nuw nsw i32 %63, 2
  %159 = add i32 %64, 2
  %160 = icmp eq i32 %159, %61
  br i1 %160, label %161, label %62, !llvm.loop !10

161:                                              ; preds = %62, %34
  %162 = phi i32 [ 0, %34 ], [ %158, %62 ]
  %163 = icmp eq i32 %58, 0
  br i1 %163, label %211, label %164

164:                                              ; preds = %161
  %165 = add i32 %47, %162
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %166
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa !7
  %169 = add i32 %48, %162
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %170
  %172 = load i8, i8 addrspace(1)* %171, align 1, !tbaa !7
  %173 = add i8 %168, %172
  %174 = add i32 %50, %162
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %175
  %177 = load i8, i8 addrspace(1)* %176, align 1, !tbaa !7
  %178 = add i8 %173, %177
  %179 = add i32 %52, %162
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %180
  %182 = load i8, i8 addrspace(1)* %181, align 1, !tbaa !7
  %183 = add i8 %178, %182
  %184 = add i32 %37, %162
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %185
  %187 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !7
  %188 = mul i8 %187, 9
  %189 = add i32 %54, %162
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %190
  %192 = load i8, i8 addrspace(1)* %191, align 1, !tbaa !7
  %193 = add i8 %183, %192
  %194 = add i32 %42, %162
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %195
  %197 = load i8, i8 addrspace(1)* %196, align 1, !tbaa !7
  %198 = add i8 %193, %197
  %199 = add i32 %55, %162
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %200
  %202 = load i8, i8 addrspace(1)* %201, align 1, !tbaa !7
  %203 = add i8 %198, %202
  %204 = add i32 %57, %162
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %205
  %207 = load i8, i8 addrspace(1)* %206, align 1, !tbaa !7
  %208 = add i8 %203, %207
  %209 = sub i8 %188, %208
  %210 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %185
  store i8 %209, i8 addrspace(1)* %210, align 1, !tbaa !7
  br label %211

211:                                              ; preds = %164, %161, %24, %5
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
